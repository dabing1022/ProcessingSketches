// https://p5js.org/examples/math-noise1d.html
// noise1d

float xoff = 0;
float yoff = 0;
float xincrement = 0.01;
float yincrement = 0.02;

void setup() {
  size(700, 400);
  background(0);
  noStroke();
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);

  float x = noise(xoff) * width;
  float y = noise(yoff) * height;
  xoff += xincrement;
  yoff += yincrement;

  fill(200);
  ellipse(x, y, 40, 40);
}
