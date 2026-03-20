#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# render_manim.sh
# ------------------------------------------------------------
# Objetivo:
#   - Activar el entorno virtual
#   - Verificar que Manim esté instalado
#   - Renderizar una escena específica
#
# Uso:
#   ./render_manim.sh
#   ./render_manim.sh --scene PlaneThroughOrigin
#   ./render_manim.sh --file scene_plane_through_origin.py
#   ./render_manim.sh --quality h
#   ./render_manim.sh --open false
#
# Valores de calidad comunes:
#   l = low
#   m = medium
#   h = high
#   p = production
#   k = 4k
#
# Ejemplo:
#   ./render_manim.sh --file scene_plane_through_origin.py --scene PlaneThroughOrigin --quality h
# ============================================================

# -----------------------------
# Configuración por defecto
# -----------------------------
VENV_DIR=".venv"
SCENE_FILE="scene_plane_through_origin.py"
SCENE_NAME="PlaneThroughOrigin"
QUALITY="h"
OPEN_AFTER_RENDER="true"

# -----------------------------
# Parseo de argumentos
# -----------------------------
while [[ $# -gt 0 ]]; do
  case "$1" in
    --file)
      SCENE_FILE="$2"
      shift 2
      ;;
    --scene)
      SCENE_NAME="$2"
      shift 2
      ;;
    --quality)
      QUALITY="$2"
      shift 2
      ;;
    --open)
      OPEN_AFTER_RENDER="$2"
      shift 2
      ;;
    *)
      echo "ERROR: argumento no reconocido: $1"
      exit 1
      ;;
  esac
done

echo "==> Preparando render..."

# -----------------------------
# Verificar entorno virtual
# -----------------------------
if [[ ! -d "${VENV_DIR}" ]]; then
  echo "ERROR: no existe ${VENV_DIR}"
  echo "Ejecuta primero: ./setup_manim.sh"
  exit 1
fi

# -----------------------------
# Activar entorno virtual
# -----------------------------
# shellcheck disable=SC1091
source "${VENV_DIR}/bin/activate"

# -----------------------------
# Verificar que manim esté disponible
# -----------------------------
if ! command -v manim >/dev/null 2>&1; then
  echo "ERROR: Manim no está disponible dentro del entorno virtual."
  echo "Ejecuta primero: ./setup_manim.sh"
  exit 1
fi

# -----------------------------
# Verificar archivo de escena
# -----------------------------
if [[ ! -f "${SCENE_FILE}" ]]; then
  echo "ERROR: no existe el archivo ${SCENE_FILE}"
  exit 1
fi

echo "   - Archivo : ${SCENE_FILE}"
echo "   - Escena  : ${SCENE_NAME}"
echo "   - Calidad : ${QUALITY}"

# -----------------------------
# Ejecutar render
# -----------------------------
if [[ "${OPEN_AFTER_RENDER}" == "true" ]]; then
  manim -p -q"${QUALITY}" "${SCENE_FILE}" "${SCENE_NAME}"
else
  manim -q"${QUALITY}" "${SCENE_FILE}" "${SCENE_NAME}"
fi

echo "==> Render completado."