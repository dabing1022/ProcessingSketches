ArrayList < AntHill > hills = new ArrayList < AntHill > ();
float lapse = 0;    // mouse timer
int i;
int hillCount;

void setup() {
  size(1112, 834);
  background(255);

  colorMode(HSB);
  hillCount = int(random(10, 15));
  for (i = 0; i < hillCount; i++) {
    hills.add(new AntHill(i));
  }
  frameRate(1);
}

void draw() {
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);
  

  for (AntHill hill: hills) {
    hill.render();
  }
}

class Ant {
  // 1. Attributes 
  PVector position = new PVector(0, 0);
  float direction;
  float speed;
  color colour;

  // 2. Constructor
  Ant(AntHill hill) {
    position = new PVector(hill.position.x, hill.position.y);
    direction = random(2 * PI);
    speed = random(1, 3);
    colour = hill.colour;
  }

  // 3. Actions
  void render() {
    stroke(colour);
    strokeWeight(5);
    point(position.x, position.y);
  }

  void move() {
    position.x += sin(direction) * speed;
    position.y += cos(direction) * speed;
    direction += random(-1, 1);
    position.x = (position.x + width) % width;
    position.y = (position.y + height) % height;
  }
}

class AntHill {
  // 1 Attributes
  PVector position = new PVector(0, 0);
  int size = 0;
  color colour;
  float index;
  ArrayList < Ant > ants = new ArrayList < Ant > ();

  // 2 Constructor
  AntHill(int index) {
    this.index = index;
    position = new PVector(random(120, width - 120), random(140, height - 140));
    colour = color(this.index/hillCount*255, 255, 255);
    size = int(random(50, 100));
    for (int a = 0; a < size; a++) {
      ants.add(new Ant(this));
    }
  }

  // 3 Actions
  void render() {
    //for (Ant ant: ants) {
    //  ant.move();
    //  ant.render();
    //}
    
    fill(colour);
    ellipse(position.x, position.y, size / 2, size / 2);
  }
}
