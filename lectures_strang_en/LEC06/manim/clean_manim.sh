#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# clean_manim.sh
# ------------------------------------------------------------
# Objetivo:
#   - Limpiar archivos temporales generados por Manim
#   - Eliminar caché de LaTeX
#   - Eliminar textos temporales
#   - Eliminar archivos parciales de render
#
# Uso:
#   ./clean_manim.sh
#   ./clean_manim.sh --all
#
# Modos:
#   sin argumentos:
#       limpia temporales y cachés
#
#   --all:
#       además elimina el entorno virtual .venv
#       (útil para reinstalar desde cero)
# ============================================================

REMOVE_VENV="false"

# -----------------------------
# Parseo de argumentos
# -----------------------------
if [[ "${1:-}" == "--all" ]]; then
  REMOVE_VENV="true"
fi

echo "==> Iniciando limpieza..."

# -----------------------------
# Limpiar directorios temporales de Manim
# -----------------------------
# Estas carpetas suelen llenarse con archivos que no conviene versionar.
if [[ -d "media/Tex" ]]; then
  echo "   - Eliminando media/Tex"
  rm -rf media/Tex
fi

if [[ -d "media/texts" ]]; then
  echo "   - Eliminando media/texts"
  rm -rf media/texts
fi

# -----------------------------
# Eliminar archivos parciales de video
# -----------------------------
# Manim crea muchos subdirectorios llamados partial_movie_files.
echo "   - Eliminando partial_movie_files"
find media -type d -name "partial_movie_files" -prune -exec rm -rf {} + 2>/dev/null || true

# -----------------------------
# Eliminar archivos de log si existen
# -----------------------------
echo "   - Eliminando logs temporales"
find . -type f -name "*.log" -delete 2>/dev/null || true

# -----------------------------
# Eliminar entorno virtual opcionalmente
# -----------------------------
if [[ "${REMOVE_VENV}" == "true" ]]; then
  if [[ -d ".venv" ]]; then
    echo "   - Eliminando entorno virtual .venv"
    rm -rf .venv
  fi
fi

echo "==> Limpieza completada."