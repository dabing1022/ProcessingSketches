import nice.palettes.*;

ColorPalette palette;

void setup() {
  size(800, 800);
  strokeWeight(3);

  palette = new ColorPalette(this);
  palette.getPalette();
}

void draw() {
  background(255);
  drawCircle(width/2, height/2, width - 30); 
  frameRate(1);
  smooth();
}

void mousePressed() {
  noiseSeed(int(random(1000)));
  palette.getPalette();
  redraw();
}

void drawCircle(int x, int y, float r) {
  fill(palette.colors[int(random(5))]);

  beginShape();
  for (float i = 0; i < 360; i += 1.0) {
    float angle = radians(i);
    float pN = noise(x + r * cos(angle) * 0.01, y + r * sin(angle) * 0.01);
    float pr = r + 465 * noise(pN);
    float circleX = x + pr * cos(angle);
    float circleY = y + pr * sin(angle);
    curveVertex(circleX, circleY);
  }


  endShape(CLOSE);


  if(r > 20) {
    r *= 0.75f;
    drawCircle(x, y, r);	 
  }				
}
