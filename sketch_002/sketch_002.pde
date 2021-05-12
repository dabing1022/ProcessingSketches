int size = 40;
int rows = 10;
int columns = 0;
int hspace = 2;
int vspace = 2;
int padding = 50;

Agent[] agents;
void setup() {
  
  size(700, 700);
  // x * size + (x - 1) * hspace + 2 * padding = width
  columns = int((width - 2 * padding + hspace) / (size + hspace));
  // x * size + (x - 1) * vspace + 2 * padding = height
  rows = int((height - 2 * padding + vspace) / (size + vspace));
  agents = new Agent[rows * columns];
  background(255);

  randomSeed(100);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      float rotation = random(0, map(i, 0, rows, 0, QUARTER_PI));
      float strokeColor = 200 - map(i, 0, rows, 0, 200);
      float strokeWeight = map(i, 0, rows, 0, 2);
      agents[columns * i + j] = new Agent(strokeColor, strokeWeight, rotation, size);  
    }
  }
 
}

void draw() {
  
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      float offsetX = random(0, map(j, 0, columns, 0, 8));
      float offsetY = random(0, map(i, 0, rows, 0, 8));
      
      float x = 50 + (size + hspace) * j + size / 2 + offsetX;
      float y = 50 + (size + vspace) * i + size / 2 + offsetY;
      
      pushMatrix();
      translate(x, y);
      agents[columns * i + j].display();  
      popMatrix();
    }
  }
  noLoop();

}

class Agent {

  float strokeColor;
  float strokeWeight;
  float size;
  float rotation;
  
  Agent(float strokeColor, float strokeWeight, float rotation, float size) {
    this.strokeColor = strokeColor;
    this.strokeWeight = strokeWeight;
    this.rotation = rotation;
    this.size = size;
  }
  
  void display() {
    stroke(this.strokeColor);
    strokeWeight(this.strokeWeight);
    
    rotate(this.rotation);
    rect(- this.size / 2, -this.size / 2, this.size, this.size);
  }
  
}
