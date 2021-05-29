ArrayList<Mover> movers = new ArrayList<Mover>();

PImage star;
void setup() {
  size(600, 600);
  colorMode(RGB);
  background(0);
  
  star = loadImage("star.png");
  //star = loadImage("student.png");
}

void draw() {
  background(0);
  for (int i = movers.size() - 1; i >= 0; i--) {
    Mover mover = movers.get(i);
    mover.run();
    if (mover.isDead()) {
      movers.remove(i);
    }
  }
}

void mouseDragged() {
  movers.add(new Mover(mouseX, mouseY, 50));
}

// Mover是生命体
class Mover {
  float x;
  float y;
  float radius;
  float life;

  Mover(float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;

    this.life = 255;
  }

  void run() {
    update();
    display1();
    //display2();     可以注释掉 display1(), 打开display2()看效果
  }

  void update() {
    life -= 12;
    life = max(life, 0);
  } 

  boolean isDead() {
    if (life <= 0.0) { 
      return true;
    } else {
      return false;
    }
  }

  void display1() {
    fill(30, 255, 255, life); 
    noStroke();
    circle(x, y, radius);
    
    fill(255);
    text(life, x, y);
  }
  
  void display2() {
    tint(255, life);
    image(star, x - 25, y - 25);
  }
}
