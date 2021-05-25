ArrayList<Mover> movers = new ArrayList<Mover>();

void setup() {
  size(800, 800);
  colorMode(HSB);
  background(0);
}

void draw() {
  background(0);
  for (int i = movers.size() - 1; i >= 0; i--) {
    Mover mover = movers.get(i);
    mover.run();
    if (mover.isDead) {
      movers.remove(i);
    }
  }
}

void mouseDragged() {
  movers.add(new Mover(mouseX, mouseY, 50));
}

class Mover {
  float x;
  float y;
  float radius;
  float lifespan;
  boolean isDead = false;

  Mover(float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;

    this.lifespan = 255;
  }

  void run() {
    update();
    display();
  }

  void update() {
    lifespan -= 12;
    lifespan = max(lifespan, 0);
  } 

  boolean isDead() {
    if (lifespan < 0.0) { 
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(30, 255, 255, lifespan); 
    noStroke();
    circle(x, y, radius);  
  } 
}
