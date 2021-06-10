float boxAWidth = 20.0;
float boxAHeight = 20.0;
float boxAx;
float boxAy;
void setup() {
  size(500, 500);
  background(255);
  
  stroke(0);
  strokeWeight(2);
}

void draw() {
  background(255);
  noFill();
  rect(150, 150, 200, 100);
  
  // 限定鼠标范围，让A在规定矩形范围内随鼠标运动
  boxAx = constrain(mouseX, 150, 150 + 200 - boxAWidth);
  boxAy = constrain(mouseY, 150, 150 + 100 - boxAHeight);
  fill(100);
  rect(boxAx, boxAy, boxAWidth, boxAHeight);

  // ----------绘制灯光
  beginShape();
  //vertex(250, 200);
  //vertex(270, 200);
  vertex(boxAx, 200); // 左上顶点
  vertex(boxAx + boxAWidth, 200); // 右上顶点
  
  float bottomRightX = boxAx + boxAWidth + 50; // 右下顶点X，比右上定点X向右偏移50
  vertex(bottomRightX, 200 + 200);
  
  float bottomLeft = boxAx - 50; // 左下顶点X，比左上顶点X向左偏移50
  vertex(bottomLeft, 200 + 200);
  
  endShape(CLOSE);
  // --------- 结束灯光绘制
  
  // -------灯光的椭圆
  float d = bottomRightX - bottomLeft;
  ellipseMode(CENTER);
  ellipse(bottomLeft + d / 2, 200 + 200, d, 30);
}
