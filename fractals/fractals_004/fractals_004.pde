// 分形 - 康托尔集
// https://zh.wikipedia.org/wiki/%E5%BA%B7%E6%89%98%E5%B0%94%E9%9B%86

float h = 10;
float offset = 0;

void setup() {
  size(800, 400);
  background(255);
}

void draw() {
  background(255);
  cantor(35, 10, 730);

  h = noise(offset) * 30 + 10;
  offset += 0.01;
}

void cantor(float x, float y, float len) {

  if (len >= 1) {
    noStroke();
    fill(0);
    rect(x, y, len, h / 3);

    y += h;

    cantor(x, y, len / 3);
    cantor(x + len * 2 / 3, y, len / 3);
  }
}