// 分形 树

float theta;   

void setup() {
  size(1000, 800);
  smooth();
}

void draw() {
  background(0);
  theta = map(mouseX, 0, width, 0, PI / 2);

  translate(width / 2, height);
  stroke(255);
  branch(200);
}

void branch(float len) {
  // 长度映射成线条粗细
  float sw = map(len, 2, 200, 1, 10);
  strokeWeight(sw);
      
  line(0, 0, 0, -len);
  translate(0, -len);

  len *= 0.66;
  if (len > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    branch(len);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();
  }
}