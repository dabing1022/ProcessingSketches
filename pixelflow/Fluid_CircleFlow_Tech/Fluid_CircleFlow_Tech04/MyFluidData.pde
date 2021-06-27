
public class MyFluidData implements DwFluid2D.FluidData {
  float x;  // 圆心位置x
  float y; // 圆心位置y
  float radius = 100; // 半径
  boolean isClockwise; // 是否是顺时针
  float angleSpeed = 0.04;
  float rx, ry, prx, pry; // 圆周运动，弧上的点位置，以及上一帧的点位置
  float angle = 0; // 角度
  color c; // 颜色

  MyFluidData() {
    x = width / 2;
    y = height / 2;
    radius = 130;
    isClockwise = true; // 是否是顺时针旋转
    angleSpeed = 0.04; // 角速度
    c = color(0.0, 0.0, 0.0);
    angle = PI / 2;
  }

  void my_update(DwFluid2D fluid) {
    float vscale = 14;

    float delta = random(-3, 3);
    // 极坐标下计算弧上点的位置，用一个随机量进行抖动
    rx = x + (radius + delta) * cos(angle); 
    ry = y + (radius + delta) * sin(angle);

    // 计算速度
    float vx = (rx - prx) * vscale;
    float vy = (ry - pry) * vscale;
    // 顺时针的话，需要乘以-1，因为y轴相反
    if (isClockwise) {
      vy = (ry - pry) * (-vscale);
    }

    float px = rx;
    float py = ry;
    // 顺时针的话，需要乘以-1，因为y轴相反
    if (isClockwise) {
      py = height - ry;
    }

    // 给流体上的点添加速度
    fluid.addVelocity(px, py, 16, vx, vy);
    float radius1 = 15;
    float radius2 = 8;
    // 给流体上的点添加密度，颜色为c，半径为radius1，稍微大点
    fluid.addDensity(px, py, radius1, red(c) / 255.0, green(c) / 255.0, blue(c) / 255.0, 1.0f);
    // 给流体上的点添加密度，颜色为白色，半径为radius2，稍微小点
    fluid.addDensity(px, py, radius2, 1.0f, 1.0f, 1.0f, 1.0f);
    //fluid.addTemperature(px, py, 30, 10);

    // 现在终将成为过去
    prx = rx;
    pry = ry;

    // 增加弧度角，用于下一帧计算，才能旋转
    float angleSpeed = 0.04;
    angle += angleSpeed;
  }

  @Override
    public void update(DwFluid2D fluid) {
    my_update(fluid);
  }
}
