// 欢迎关注 小菜与老鸟 （公众号、视频号、Bilibili号）

int viewport_w = 600; // 定义窗口宽
int viewport_h = 600; // 定义窗口高

float taichi_radius = 100;
Taichi taichi;
PGraphics pg_taichi;

void settings() {
  size(viewport_w, viewport_h);
  
}

void setup() {
  background(200);
  
  pg_taichi = createGraphics(width , height);
  
  taichi = new Taichi(new PVector(width / 2, height / 2), 100, pg_taichi);
}

void draw() {
  background(200);
  
  taichi.display();
  image(pg_taichi, 0, 0);
}
