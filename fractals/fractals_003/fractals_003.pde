import controlP5.*;

Slider r_dSlider; // right circle slider control d
Slider l_dSlider; // left circle slider control d
Slider t_dSlider; // top circle slider control d
Slider b_dSlider; // bottom circle slider control d

ControlP5 cp5;

void setup() {
  size(1000, 800);

  cp5 = new ControlP5(this);

  frameRate(30);
  background(0);

  r_dSlider = cp5.addSlider("right d")
    .setPosition(10, 40)
    .setRange(2, 10)
    .setSize(100, 20)
    .setValue(2);

  l_dSlider = cp5.addSlider("left d")
    .setPosition(10, 100)
    .setRange(2, 10)
    .setSize(100, 20)
    .setValue(2);

  t_dSlider = cp5.addSlider("top d")
    .setPosition(10, 160)
    .setRange(2, 10)
    .setSize(100, 20)
    .setValue(2);

  b_dSlider = cp5.addSlider("bottom d")
    .setPosition(10, 220)
    .setRange(2, 10)
    .setSize(100, 20)
    .setValue(2);
}

void draw() {
  background(0);
  drawCircle(width / 2, height / 2, 400);
}


void drawCircle(float x, float y, float d) {
  noFill();
  stroke(255, 255, 0);
  strokeWeight(2);
  ellipse(x, y, d, d);

  if (d > 10) {
    drawCircle(x + d / 2, y, d / (r_dSlider.getValue()));
    drawCircle(x - d / 2, y, d / (l_dSlider.getValue()));
    drawCircle(x, y + d / 2, d / (b_dSlider.getValue()));
    drawCircle(x, y - d / 2, d / (t_dSlider.getValue()));
  }
}
