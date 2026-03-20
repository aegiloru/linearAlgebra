from manim import *
import numpy as np


class PlaneThroughOrigin(ThreeDScene):
    """
    Scene: Linear combinations generate a plane

    Objetivo didáctico:
    - Mostrar dos vectores v y w que parten del origen.
    - Mostrar que todas las combinaciones lineales c v + d w
      generan un plano.
    - Reforzar que ese plano pasa por el origen.
    - Concluir que, por ello, representa un subespacio.
    """

    def construct(self):
        # ============================================================
        # 1) TÍTULO FIJO EN PANTALLA
        # ============================================================
        title = Text(
            "Linear combinations generate a plane",
            font_size=34
        )
        title.to_edge(UP)

        # add_fixed_in_frame_mobjects mantiene el texto “pegado a la pantalla”
        # aunque la escena sea 3D.
        self.add_fixed_in_frame_mobjects(title)
        self.play(Write(title))

        # ============================================================
        # 2) CONFIGURACIÓN DE CÁMARA
        # ============================================================
        # Vista oblicua cómoda para interpretar el plano y los vectores.
        self.set_camera_orientation(
            phi=65 * DEGREES,
            theta=-45 * DEGREES
        )

        # ============================================================
        # 3) EJES 3D
        # ============================================================
        axes = ThreeDAxes(
            x_range=[-4, 4, 1],
            y_range=[-4, 4, 1],
            z_range=[-3, 3, 1],
            x_length=7,
            y_length=7,
            z_length=5,
        )

        labels = axes.get_axis_labels(
            Tex("x"),
            Tex("y"),
            Tex("z")
        )

        self.play(Create(axes), Write(labels))

        # ============================================================
        # 4) ORIGEN
        # ============================================================
        origin = axes.c2p(0, 0, 0)

        origin_dot = Dot3D(
            point=origin,
            radius=0.06
        )

        origin_label = MathTex(r"\mathbf{0}")
        origin_label.scale(0.8)
        origin_label.next_to(origin_dot, DOWN)

        # Mantener el label legible frente a la cámara
        self.add_fixed_orientation_mobjects(origin_label)

        self.play(FadeIn(origin_dot), Write(origin_label))

        # ============================================================
        # 5) DEFINICIÓN DE LOS VECTORES v y w
        # ============================================================
        # Coordenadas escogidas para que el plano generado sea visualmente claro.
        v_coords = np.array([2.5, 1.0, 0.5])
        w_coords = np.array([-1.2, 2.0, 0.8])

        v_end = axes.c2p(*v_coords)
        w_end = axes.c2p(*w_coords)

        v_arrow = Arrow3D(
            start=origin,
            end=v_end,
            resolution=8
        )

        w_arrow = Arrow3D(
            start=origin,
            end=w_end,
            resolution=8
        )

        v_label = MathTex(r"\mathbf{v}")
        w_label = MathTex(r"\mathbf{w}")

        # Las etiquetas deben mantenerse orientadas hacia el observador
        self.add_fixed_orientation_mobjects(v_label, w_label)

        # Posición manual para evitar superposición visual
        v_label.move_to(axes.c2p(2.9, 1.2, 0.7))
        w_label.move_to(axes.c2p(-1.4, 2.3, 1.0))

        # IMPORTANTE:
        # GrowArrow suele fallar con Arrow3D.
        # Usamos Create para una animación compatible y estable.
        self.play(Create(v_arrow), Write(v_label))
        self.play(Create(w_arrow), Write(w_label))

        # ============================================================
        # 6) TEXTO DE COMBINACIÓN LINEAL
        # ============================================================
        combo_text = MathTex(r"c\mathbf{v}+d\mathbf{w}")
        combo_text.to_corner(UL).shift(DOWN * 0.8)

        self.add_fixed_in_frame_mobjects(combo_text)
        self.play(Write(combo_text))

        # ============================================================
        # 7) PLANO CORRECTO: span{v, w}
        # ============================================================
        # Construimos el plano mediante la parametrización:
        #   u*v + s*w
        # con lo cual el objeto mostrado sí es el plano generado por v y w.
        plane = Surface(
            lambda u, s: axes.c2p(*(u * v_coords + s * w_coords)),
            u_range=[-1.5, 1.5],
            v_range=[-1.5, 1.5],
            resolution=(18, 18),
            fill_opacity=0.35,
            checkerboard_colors=[BLUE_D, BLUE_E],
            stroke_color=BLUE_B,
            stroke_opacity=0.45,
        )

        plane_label = MathTex(r"P=\mathrm{span}\{\mathbf{v},\mathbf{w}\}")
        plane_label.to_corner(UR).shift(DOWN * 0.8)

        self.add_fixed_in_frame_mobjects(plane_label)
        self.play(Create(plane), Write(plane_label))
        self.wait(1)

        # ============================================================
        # 8) PUNTO MÓVIL SOBRE EL PLANO
        # ============================================================
        # Este punto recorre distintas combinaciones lineales para
        # reforzar visualmente que c*v + d*w permanece dentro del plano.
        moving_point = Dot3D(
            point=origin,
            radius=0.05,
            color=YELLOW
        )

        self.play(FadeIn(moving_point))

        # Primera combinación lineal
        c1, d1 = 1.0, 0.5
        p1 = axes.c2p(*(c1 * v_coords + d1 * w_coords))
        self.play(moving_point.animate.move_to(p1), run_time=2)

        # Segunda combinación lineal
        c2, d2 = -0.8, 1.2
        p2 = axes.c2p(*(c2 * v_coords + d2 * w_coords))
        self.play(moving_point.animate.move_to(p2), run_time=2)

        # Tercera combinación lineal
        c3, d3 = 0.7, -1.0
        p3 = axes.c2p(*(c3 * v_coords + d3 * w_coords))
        self.play(moving_point.animate.move_to(p3), run_time=2)

        self.wait(1)

        # ============================================================
        # 9) ÉNFASIS EN EL ORIGEN
        # ============================================================
        # Refuerzo visual: el plano pasa por el origen.
        self.play(Indicate(origin_dot, scale_factor=1.5))
        self.wait(0.5)

        # ============================================================
        # 10) CONCLUSIÓN
        # ============================================================
        conclusion = MathTex(
            r"\text{Plane through the origin} \Rightarrow \text{subspace}"
        )
        conclusion.scale(0.8)
        conclusion.to_edge(DOWN)

        self.add_fixed_in_frame_mobjects(conclusion)
        self.play(Write(conclusion))

        self.wait(3)