void setup() {
 size(800, 800);
 colorMode(HSB, 360, 100, 100, 100);
 smooth();
 noStroke();
 noLoop();
}
void draw() {
 float xInit = width * 0.5;
 float yInit = height * 0.5;
 float rDiv = width * 0.2;
 background(0.0, 0.0, 90.0, 100.0);
 for (float rBase = width * 0.05; rBase < width * 0.35; rBase += width * 0.01) {
   fill(rBase % 360.0, 60.0, 60.0, 100.0);
   for (float radian = 0.0; radian < TWO_PI; radian += 0.005) {
     float pN = noise(xInit + rBase * cos(radian) * 0.02, yInit + rBase * sin(radian) * 0.02);
     float pR = rBase + rDiv * noise(pN);
     float pX = xInit + pR * cos(radian);
     float pY = yInit + pR * sin(radian);
     ellipse(pX, pY, 2.0, 2.0);
   }
   
 }      
}
