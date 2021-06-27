// 欢迎关注 小菜与老鸟 （公众号、视频号、Bilibili号）

class Taichi {
  PVector location;
  float radius;
  PGraphics pg;
  float angle = 0;

  Taichi(PVector location, float radius, PGraphics pg) {
    this.location = location;
    this.radius = radius;
    this.pg = pg;
  }

  void display() {
    float d = 2 * taichi_radius;
    angle += 0.01;
    
    pg.beginDraw();
    pg.clear();

    pg.pushMatrix();
    pg.noStroke();
    pg.translate(location.x, location.y);  // 平移坐标系，方便使用相对位置进行绘制
    pg.rotate(angle);
    pg.fill(0);
    pg.arc(0, 0, d, d, PI / 2, PI * 3 / 2);

    pg.fill(255);
    pg.arc(0, 0, d, d, -PI / 2, PI / 2);

    pg.fill(255);
    pg.circle(0, d / 4, taichi_radius);

    pg.fill(0);
    pg.circle(0, -d / 4, taichi_radius);

    pg.fill(0);
    pg.circle(0, d / 4, taichi_radius / 5);

    pg.fill(255);
    pg.circle(0, -d / 4, taichi_radius / 5);

    pg.popMatrix();
    
    pg.endDraw();
  }
}
