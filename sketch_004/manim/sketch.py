from manim import *


class Sketch(Scene):
    def construct(self):
        rect = Rectangle(width=300, height=300)
        self.play(Create(rect))
        self.wait()

        tech_lines = Text('create stage 创建一个舞台', font='Hack Nerd Font Mono')
        self.play(Create(tech_lines))
        self.wait()
