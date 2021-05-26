// 创建一个数组 用来存放粒子
ArrayList<Particle> ps5 = new ArrayList<Particle>();

void setup() {
  size(600, 600);
}

void draw() {
  clear();
  background(0);
  blendMode(ADD);
  ps5.add(new Particle(width/2, height/3*2));
  for(Particle p : ps5) {
    // 给予加速度
    p.update(map(mouseX, 0, width, -0.03, 0.03), map(mouseY, 0, height, -0.03, 0.03));
  }
  // 移除掉生命值已经小于等于0的粒子（已经死亡）
  for (int i = ps5.size() - 1; i >= 0; i--) {
    Particle p = ps5.get(i);
    if (p.life <= 0) {
      ps5.remove(i);
    }
  }
  // 然后开始绘制
  for(Particle p : ps5) {
    p.draw();
  }
}

class Particle {
  float x; // x轴位置
  float y; // y轴位置
  float vx; // x轴速度
  float vy; // y轴速度
  float life; // 生命
  Particle(float x, float y){
    this.x = x;
    this.y = y;
    this.vx = randomGaussian() + 0.4;
    this.vy = randomGaussian() * (-1) + 0.4;
    this.life = 255;
  }
  
  // ax 横向加速度
  // ay 纵向加速度
  void update(float ax, float ay) {
    // 根据加速度更新速度
    this.vx += ax;
    this.vy += ay;
    // 根据速度更新位置
    this.x += this.vx;
    this.y += this.vy;
    this.life -= 1; // 生命流逝
  }
  
  void draw(){
    noStroke();
    fill(255, 24, 0, this.life); // life为0时候，透明度为0，看不见了
    circle(this.x, this.y, map(this.life, 0, 255, 0, width/10));
  }
}
