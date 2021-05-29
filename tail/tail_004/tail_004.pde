// 中学生班级晨跑法

int num = 100; // 100个同学
int[] x = new int[num];
int[] y = new int[num];

void setup() {
  size(600, 600);
  noStroke();
  fill(255, 100);
}

void draw() {
  background(0);

  // 从尾巴到头部，每个节点位置更新成上一个节点的位置
  // 在此帧绘制中，每一个同学的位置是上一个同学的位置
  for (int i = num - 1; i > 0; i--) {
    x[i] = x[i - 1];
    y[i] = y[i - 1];
  }

  // 队首同学跑步，跟着鼠标跑
  x[0] = mouseX;
  y[0] = mouseY;

  for (int i = 0; i < num; i++) {
    // 越靠前的位置，圆圈越大，越靠后，尾巴越小
    ellipse(x[i], y[i], (num - i) / 2, (num - i) / 2);
    // 越靠前的位置，圆圈越小，越靠后，尾巴越大
    //ellipse(x[i], y[i], i / 2, i / 2);
    // 所有圆圈固定大小
    //ellipse(x[i], y[i], 30, 30);
  }
}
