# Installation Guide – Manim Environment (Lecture 06)

## Requirements

### macOS (recommended)

Install Homebrew:

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Install dependencies:

brew install ffmpeg pkg-config cairo pango

---

## Python Environment

Navigate to:

cd lectures_strang_en/LEC06/manim

Run:

./setup_manim.sh

---

## Render Animation

Activate environment:

source .venv/bin/activate

Run:

./render_manim.sh

Or:

manim -pqh scene_plane_through_origin.py PlaneThroughOrigin

---

## Clean

./clean_manim.sh

Full reset:

./clean_manim.sh --all

---

## Outputs

lectures_strang_en/LEC06/media/

- plane_span_scene.mp4
- plane_span_preview.png
