#!/usr/bin/env bash

set -Eeuo pipefail

project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
site_dir="${project_dir}/site"
pdf_dir="${site_dir}/assets/pdf"
pdf_file="${pdf_dir}/bases-de-datos-oracle.pdf"
python_bin="${PYTHON_BIN:-}"
chrome_bin="${CHROME_BIN:-}"
chrome_profile=""

cleanup() {
  if [[ -n "${chrome_profile}" && -d "${chrome_profile}" ]]; then
    rm -rf -- "${chrome_profile}"
  fi
}

trap cleanup EXIT

if [[ -z "${python_bin}" ]]; then
  if [[ -x "${project_dir}/.venv/bin/python" ]]; then
    python_bin="${project_dir}/.venv/bin/python"
  elif command -v python3 >/dev/null 2>&1; then
    python_bin="$(command -v python3)"
  else
    python_bin="$(command -v python)"
  fi
fi

if [[ -z "${python_bin}" || ! -x "${python_bin}" ]]; then
  echo "No se encontró Python. Define PYTHON_BIN con la ruta del ejecutable." >&2
  exit 1
fi

if [[ -z "${chrome_bin}" ]]; then
  for candidate in google-chrome google-chrome-stable chromium chromium-browser; do
    if command -v "${candidate}" >/dev/null 2>&1; then
      chrome_bin="$(command -v "${candidate}")"
      break
    fi
  done
fi

if [[ -z "${chrome_bin}" || ! -x "${chrome_bin}" ]]; then
  echo "No se encontró Chrome o Chromium. Define CHROME_BIN con su ruta." >&2
  exit 1
fi

cd "${project_dir}"
"${python_bin}" -m mkdocs build --strict
mkdir -p "${pdf_dir}"

print_url="$("${python_bin}" -c \
  'from pathlib import Path; import sys; print(Path(sys.argv[1]).resolve().as_uri())' \
  "${site_dir}/imprimir/index.html")"

chrome_profile="$(mktemp -d "${TMPDIR:-/tmp}/mkdocs-pdf-chrome.XXXXXX")"
"${chrome_bin}" \
  --headless=new \
  --no-sandbox \
  --disable-gpu \
  --disable-dev-shm-usage \
  --allow-file-access-from-files \
  --no-pdf-header-footer \
  --run-all-compositor-stages-before-draw \
  --timeout=10000 \
  --user-data-dir="${chrome_profile}" \
  --print-to-pdf="${pdf_file}" \
  "${print_url}"

if [[ ! -s "${pdf_file}" || "$(head -c 5 "${pdf_file}")" != "%PDF-" ]]; then
  echo "Chrome no generó un PDF válido en ${pdf_file}." >&2
  exit 1
fi

echo "PDF generado: ${pdf_file}"
