// 欢迎关注 小菜与老鸟 （公众号、视频号、Bilibili号）

int viewport_w = 600; // 定义窗口宽
int viewport_h = 600; // 定义窗口高

float taichi_radius = 100;

void settings() {
  size(viewport_w, viewport_h);
  
}

void setup() {
  background(200);
}

void draw() {
  float d = 2 * taichi_radius;
  
  pushMatrix();
  noStroke();
  translate(width / 2, height / 2);
  fill(0);
  arc(0, 0, d, d, PI / 2, PI * 3 / 2);
  
  fill(255);
  arc(0, 0, d, d, -PI / 2, PI / 2);
  
  fill(255);
  circle(0, d / 4, taichi_radius); 
   
  fill(0);
  circle(0, -d / 4, taichi_radius);
  
  fill(0);
  circle(0, d / 4, taichi_radius / 5);
  
  fill(255);
  circle(0, -d / 4, taichi_radius / 5);
  
  popMatrix();
}
