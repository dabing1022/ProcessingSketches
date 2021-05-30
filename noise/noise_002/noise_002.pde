// https://p5js.org/examples/math-noise-wave.html
// noise wave

float yoff = 0;

void setup() {
  size(700, 400);
}

void draw() {
  background(161);

  fill(0, 0, 200);
  beginShape();

  float xoff = 0;

  for (float x = 0; x <= width; x += 10) {
    float y = map(noise(xoff, yoff), 0, 1, 200, 300);
    //float y = map(noise(xoff), 0, 1, 200, 300);
    vertex(x, y);

    xoff += 0.04;
  }

  yoff += 0.01;

  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}
