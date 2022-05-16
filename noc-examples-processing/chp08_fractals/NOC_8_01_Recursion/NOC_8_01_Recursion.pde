// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Recursion

int index = 0;
void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  drawCircle(width/2, height/2, width);
  noLoop();
}

void drawCircle(int x, int y, float d) {
  noFill();
  circle(x, y, d);
  fill(0);
  text(index, x + (d / 2 - 10) * cos(0), y + (d / 2 - 10) * sin(0));
  index += 1;


  if (d > 120) {
    d *= 0.75f;
    drawCircle(x, y, d);
  }
}
