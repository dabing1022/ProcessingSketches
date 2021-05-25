int num = 1000;//the number of point(s).
float mts = PI/12;//max theta speed.
int r = 10;//radius of the circle
int rdtr = 100;//range of the rdt
int rdu = 1;//radius of circle

float n;
float p;


PVector v[]=new PVector[num];
boolean mv = true;
boolean mo = true;
color c[] = new color[num];//color of each point.
float theta[] = new float[num];//original angle of each point.
float mtheta[] = new float[num];//translate angle to math value.
float dtheta[] = new float[num];//speed of theta.
float easing[] = new float[num];
int rdt[] = new int[num];//make a shuffle of radius.
PFont f; //申明对象
void setup() {

  colorMode(RGB, 0, 255, 0, 255);
  size(600, 800);
  for (int i =0; i<num-1; i++) {
    c[i] = color(random(100, 200), random(100, 200), random(100, 200));
    v[i] = new PVector(random(width), random(height));
    theta[i] = round(random(360));
    dtheta[i] = random(mts);
    mtheta[i] = theta[i]/180*PI;
    rdt[i] = round(random(-rdtr, rdtr));
    easing[i] = random(0.02, 0.3);
  }
  frameRate(60);
}



void draw() {
  background(0);

  PFont font=createFont("Noteworthy-Bold-48", 300);

  textSize(50);
  textFont(font);

  n=dist(300, 400, mouseX, mouseY);

  fill(0, 255, 0, 255);
  text("自", 140, 350);

  fill(0, 255, 0, n);
  text("然", 140, 650);

  fill(0, 255, 0, 255 - n);
  text("大", 140, 650);

  //fill(0, 0, 0, (255-n));
  //rect(0, 0, 600, 800);


  pushMatrix();


  noStroke();
  if (mv) {
    if (mo) {
      for (int i = 0; i<num-1; i++) {
        mtheta[i] += dtheta[i];
        v[i].lerp(mouseX+cos(mtheta[i])*(rdt[i]+r), mouseY+sin(mtheta[i])*(rdt[i]+r), 0, easing[i]);
        fill(c[i]);
        ellipse(v[i].x, v[i].y, rdu, rdu);
      }
    }
    if (!mo) {
      for (int i = 0; i<num-1; i++) {
        v[i].lerp(mouseX+cos(mtheta[i])*(rdt[i]+r), mouseY+sin(mtheta[i])*(rdt[i]+r), 0, easing[i]);
        fill(c[i]);
        ellipse(v[i].x, v[i].y, rdu, rdu);
      }
    }
  }
  if (!mv) {
    if (mo) {
      for (int i = 0; i<num-1; i++) {
        mtheta[i] += dtheta[i];
        v[i].lerp(mouseX+cos(mtheta[i])*rdt[i], mouseY+sin(mtheta[i])*rdt[i], 0, easing[i]);
        fill(c[i]);
        ellipse(v[i].x, v[i].y, rdu, rdu);
      }
    }
    if (!mo) {
      for (int i = 0; i<num-1; i++) {
        v[i].lerp(mouseX+cos(mtheta[i])*rdt[i], mouseY+sin(mtheta[i])*rdt[i], 0, easing[i]);
        fill(c[i]);
        ellipse(v[i].x, v[i].y, rdu, rdu);
      }
    }
  }
  popMatrix();

  noCursor();  // 看不见鼠标
}



void mousePressed() {
  noStroke();
  fill(255);

  rect(0, 0, 600, 800);
}
