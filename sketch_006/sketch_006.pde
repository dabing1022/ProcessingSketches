int r = 400;

void setup() {
  size(800, 800);
  background(0);
  colorMode(HSB);
}

void draw() {
  translate(400, 400);
  
  for (float i = 0; i < 360; i+=0.1) {
    float rad = radians(i);
    for (int j = 0; j < r; j+=10) {
      float h = map(i, 0, 360, 0, 255);
      float s = map(j, 0, r, 0, 255);
      float b = 255; 
      float x = j * cos(rad);
      float y = j * sin(rad);
      stroke(h, s, b);
      point(x, y);
    }
  }
  
 
  //noLoop();
}
