// 分形 - 谢尔宾斯基地毯
// https://zh.wikipedia.org/wiki/%E5%BA%B7%E6%89%98%E5%B0%94%E9%9B%86

float h = 10;
float offset = 0;

float backgroundGray = 0;
float fillGray = 255;
int index;

void setup() {
  size(800, 800);
  background(backgroundGray);

  noStroke();
  rectMode(CENTER);
}

void mousePressed() {
  if (index % 2 == 0) {
    backgroundGray = 0;
    fillGray = 255;
  } else {
    backgroundGray = 255;
    fillGray = 0;
  }
  index += 1;
  redraw();
}

void draw() {
  background(backgroundGray);
  fill(fillGray);

  cantor(width / 2, height / 2, 750);
  noLoop();
}

void cantor(float x, float y, float len) {
  float size =  len / 3;
  if (size > 1) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (i == 1 && j == 1) {
          rect(x, y, size, size);
        } else {
          cantor(x + size * (i - 1), y + size * (j - 1), size);
        }
      }
    }
  }
}