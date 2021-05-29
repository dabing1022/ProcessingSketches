float radius = 10;
int centerX;
int centerY;

void setup() {
  size(1200, 700);
  centerX = width / 2;
  centerY = height / 2;
  background(255);
  smooth();
  noFill();
  noLoop();
}

void draw() {
  stroke(20, 50, 70);
  float x, y;
  float lastx = -999;
  float lasty = -999;

  for (float ang = 0; ang <= 360 * 8; ang += 5) {
    radius += 0.5;
    float rad = radians(ang);
    x = centerX + radius * cos(rad);
    y = centerY + radius * sin(rad);
    if (lastx > -999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
  }
}
