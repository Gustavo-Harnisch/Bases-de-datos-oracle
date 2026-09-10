#!/usr/bin/env python3
"""Valida los criterios estructurales del mapa académico INF-324."""

from __future__ import annotations

import re
import sys
from collections import Counter
from datetime import date
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MAP_PATH = ROOT / "MAPA_ACADEMICO_36_CLASES.md"


def section(text: str, name: str) -> str:
    start = f"<!-- {name}_INICIO -->"
    end = f"<!-- {name}_FIN -->"
    if start not in text or end not in text:
        raise ValueError(f"faltan marcadores de sección: {name}")
    return text.split(start, 1)[1].split(end, 1)[0]


def markdown_rows(block: str, prefix: str) -> list[list[str]]:
    rows: list[list[str]] = []
    for line in block.splitlines():
        if not line.startswith("|"):
            continue
        cells = [cell.strip() for cell in line.strip().strip("|").split("|")]
        if not re.fullmatch(rf"{re.escape(prefix)}\d{{2}}", cells[0]):
            continue
        rows.append(cells)
    return rows


def fail(errors: list[str], message: str) -> None:
    errors.append(message)


def main() -> int:
    text = MAP_PATH.read_text(encoding="utf-8")
    errors: list[str] = []

    classes = markdown_rows(section(text, "MAPA_CLASES"), "C")
    expected_ids = [f"C{number:02d}" for number in range(1, 37)]
    actual_ids = [row[0] for row in classes]
    if actual_ids != expected_ids:
        fail(errors, "las clases deben ser exactamente C01-C36 y estar ordenadas")

    expected_counts = {("U1", "RA1"): 14, ("U2", "RA2"): 14, ("U3", "RA3"): 8}
    pairs: Counter[tuple[str, str]] = Counter()
    for row in classes:
        if len(row) != 6:
            fail(errors, f"{row[0]} no tiene las seis columnas requeridas")
            continue
        unit, learning_result = row[3], row[4]
        if (unit, learning_result) not in expected_counts:
            fail(errors, f"{row[0]} tiene una relación unidad-RA inválida")
        pairs[(unit, learning_result)] += 1
    if dict(pairs) != expected_counts:
        fail(errors, f"distribución unidad-RA incorrecta: {dict(pairs)}")

    sources = markdown_rows(section(text, "FUENTES"), "F-")
    if [row[0] for row in sources] != ["F-01", "F-02", "F-03"]:
        fail(errors, "el inventario debe contener exactamente F-01, F-02 y F-03")
    for row in sources:
        if len(row) != 4 or not row[2] or not row[3]:
            fail(errors, f"{row[0]} no tiene destino y estado completos")

    pending = markdown_rows(section(text, "PENDIENTES"), "P-")
    if not pending:
        fail(errors, "no hay decisiones pendientes registradas")
    for row in pending:
        if len(row) != 5 or not row[2]:
            fail(errors, f"{row[0]} no tiene responsable o estructura completa")
            continue
        try:
            date.fromisoformat(row[3])
        except ValueError:
            fail(errors, f"{row[0]} no tiene fecha ISO válida: {row[3]}")

    excluded_rule = "`Proyecto final/` está fuera del alcance"
    if excluded_rule not in text:
        fail(errors, "falta la declaración explícita de exclusión de alcance")

    if errors:
        for error in errors:
            print(f"ERROR: {error}", file=sys.stderr)
        return 1

    print("OK: 36 clases (14/14/8), 3 fuentes y decisiones pendientes validadas.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
