import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.fluid.DwFluid2D;

import processing.core.*;
import processing.opengl.PGraphics2D;

// 欢迎关注 小菜与老鸟 （公众号、视频号、Bilibili号）

int viewport_w = 600; // 定义窗口宽
int viewport_h = 600; // 定义窗口高
color bg_color = #FFFFFF;

DwFluid2D fluid; // 流体
PGraphics2D pg_fluid; // 流体层

Taichi taichi; // 太极
PGraphics2D pg_taichi;  // 太极图层
float taichi_radius = 100;

void settings() {
  size(viewport_w, viewport_h, P2D);
}

void setup() {
  background(bg_color);
  frameRate(60);

  // 设置流体参数
  setupFluid();

  // 设置太极图
  setupTaichi();
}

void setupFluid() {
  // 初始化pixelflow
  DwPixelFlow context = new DwPixelFlow(this);
  context.print();
  context.printGL();

  // 流体模拟
  fluid = new DwFluid2D(context, width, height, 1);
  fluid.param.dissipation_velocity = 0.70f;
  fluid.param.dissipation_density  = 0.60f;

  fluid.addCallback_FluiData(new MyFluidData());

  // 流体层
  pg_fluid = (PGraphics2D)createGraphics(width, height, P2D);
}

void setupTaichi() {
  pg_taichi = (PGraphics2D)createGraphics(viewport_w, viewport_h, P2D);
  pg_taichi.smooth(4);

  taichi = new Taichi(new PVector(width / 2, height / 2), 100, pg_taichi);
}

void draw() {
  // 流体更新
  drawFluid();
  // 太极图
  drawTaichi();
}

void drawFluid() {
  fluid.update();
  fluid.renderFluidTextures(pg_fluid, 0);

  // 显示流体层
  image(pg_fluid, 0, 0);
}

void drawTaichi() {
  pg_taichi.beginDraw();
  pg_taichi.blendMode(REPLACE);
  pg_taichi.clear();

  pg_taichi.pushMatrix();
  taichi.display();
  pg_taichi.popMatrix();

  pg_taichi.endDraw();

  image(pg_taichi, 0, 0);
}
