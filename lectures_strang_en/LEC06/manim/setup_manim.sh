#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# setup_manim.sh
# ------------------------------------------------------------
# Objetivo:
#   - Verificar dependencias básicas del sistema
#   - Crear entorno virtual Python si no existe
#   - Activar el entorno virtual
#   - Actualizar pip, setuptools y wheel
#   - Instalar o actualizar Manim
#
# Uso:
#   ./setup_manim.sh
#
# Notas:
#   - Pensado para macOS con Homebrew
#   - Se ejecuta dentro de la carpeta:
#       lectures_strang_en/LEC06/manim/
# ============================================================

# -----------------------------
# Configuración básica
# -----------------------------
PYTHON_BIN="python3"
VENV_DIR=".venv"

echo "==> Iniciando setup de Manim..."

# -----------------------------
# Verificar Homebrew
# -----------------------------
if ! command -v brew >/dev/null 2>&1; then
  echo "ERROR: Homebrew no está instalado."
  echo "Instálalo primero desde https://brew.sh/"
  exit 1
fi

# -----------------------------
# Verificar Python
# -----------------------------
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  echo "ERROR: No se encontró ${PYTHON_BIN}."
  exit 1
fi

# -----------------------------
# Instalar dependencias del sistema
# -----------------------------
# Estas dependencias suelen ser necesarias para Manim.
# Si ya existen, no se reinstalan.
echo "==> Verificando dependencias del sistema..."

for pkg in ffmpeg pkg-config cairo pango; do
  if brew list "$pkg" >/dev/null 2>&1; then
    echo "   - $pkg ya está instalado"
  else
    echo "   - Instalando $pkg..."
    brew install "$pkg"
  fi
done

# -----------------------------
# Crear entorno virtual
# -----------------------------
if [[ ! -d "${VENV_DIR}" ]]; then
  echo "==> Creando entorno virtual en ${VENV_DIR}..."
  "${PYTHON_BIN}" -m venv "${VENV_DIR}"
else
  echo "==> El entorno virtual ${VENV_DIR} ya existe"
fi

# -----------------------------
# Activar entorno virtual
# -----------------------------
# shellcheck disable=SC1091
source "${VENV_DIR}/bin/activate"

# -----------------------------
# Actualizar herramientas base de Python
# -----------------------------
echo "==> Actualizando pip, setuptools y wheel..."
python -m pip install --upgrade pip setuptools wheel

# -----------------------------
# Instalar o actualizar Manim
# -----------------------------
echo "==> Instalando/actualizando Manim..."
pip install --upgrade manim

# -----------------------------
# Verificación final
# -----------------------------
echo "==> Verificando instalación..."
manim --version

echo "==> Setup completado correctamente."