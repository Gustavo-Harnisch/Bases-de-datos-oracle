#!/usr/bin/env bash

set -Eeuo pipefail

project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
site_dir="${project_dir}/site"
pdf_dir="${site_dir}/assets/pdf"
pdf_file="${pdf_dir}/bases-de-datos-oracle.pdf"
presentation_source_dir="${project_dir}/U1/presentaciones"
presentation_pdf_dir="${pdf_dir}/presentaciones"
sql_source_dir="${project_dir}/U1/codigos"
sql_download_dir="${site_dir}/assets/downloads/u1/codigos"
python_bin="${PYTHON_BIN:-}"
chrome_bin="${CHROME_BIN:-}"
libreoffice_bin="${LIBREOFFICE_BIN:-}"
chrome_profile=""
libreoffice_profile=""

cleanup() {
  if [[ -n "${chrome_profile}" && -d "${chrome_profile}" ]]; then
    rm -rf -- "${chrome_profile}"
  fi
  if [[ -n "${libreoffice_profile}" && -d "${libreoffice_profile}" ]]; then
    rm -rf -- "${libreoffice_profile}"
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

if [[ -z "${libreoffice_bin}" ]] && command -v libreoffice >/dev/null 2>&1; then
  libreoffice_bin="$(command -v libreoffice)"
fi

cd "${project_dir}"
"${python_bin}" -m mkdocs build --strict
mkdir -p "${pdf_dir}" "${presentation_pdf_dir}" "${sql_download_dir}"

# Publica una copia descargable de cada SQL sin mantener una segunda fuente.
while IFS= read -r -d '' sql_file; do
  cp -- "${sql_file}" "${sql_download_dir}/$(basename -- "${sql_file}")"
done < <(find "${sql_source_dir}" -maxdepth 1 -type f -name '*.sql' -print0 | sort -z)

# Convierte las presentaciones cuando LibreOffice está disponible. En GitHub
# Actions se instala explícitamente; localmente se puede omitir sin bloquear el
# PDF general.
if [[ -n "${libreoffice_bin}" && -x "${libreoffice_bin}" ]]; then
  libreoffice_profile="$(mktemp -d "${TMPDIR:-/tmp}/mkdocs-ppt-libreoffice.XXXXXX")"
  libreoffice_profile_uri="$("${python_bin}" -c \
    'from pathlib import Path; import sys; print(Path(sys.argv[1]).resolve().as_uri())' \
    "${libreoffice_profile}")"

  while IFS= read -r -d '' presentation_file; do
    "${libreoffice_bin}" \
      "-env:UserInstallation=${libreoffice_profile_uri}" \
      --headless \
      --convert-to 'pdf:impress_pdf_Export' \
      --outdir "${presentation_pdf_dir}" \
      "${presentation_file}"

    presentation_name="$(basename -- "${presentation_file%.*}")"
    presentation_pdf="${presentation_pdf_dir}/${presentation_name}.pdf"
    if [[ ! -s "${presentation_pdf}" || "$(head -c 5 "${presentation_pdf}")" != "%PDF-" ]]; then
      echo "LibreOffice no generó un PDF válido para ${presentation_file}." >&2
      exit 1
    fi
  done < <(find "${presentation_source_dir}" -maxdepth 1 -type f \( -name '*.ppt' -o -name '*.pptx' \) -print0 | sort -z)
else
  echo "Aviso: LibreOffice no está disponible; se omiten los PDF de presentaciones." >&2
fi

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
echo "SQL descargables: ${sql_download_dir}"
if [[ -d "${presentation_pdf_dir}" ]]; then
  echo "PDF de presentaciones: ${presentation_pdf_dir}"
fi
