// 欢迎关注 小菜与老鸟 （公众号、视频号、Bilibili号）

class Taichi {
  PVector location;
  float radius;

  Taichi(PVector location, float radius) {
    this.location = location;
    this.radius = radius;
  }

  void display() {
    float d = 2 * taichi_radius;

    pushMatrix();
    noStroke();
    translate(location.x, location.y);  // 平移坐标系，方便使用相对位置进行绘制
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
}
