import controlP5.*;

ArrayList<Wobbler> theSwarm = new ArrayList<Wobbler>();

float repulsion = 220;
float viscosity = 0.01;

ControlP5 cp5;
Slider repulsionSlider, viscositySlider;

void setup() {
  cp5 = new ControlP5(this);

  repulsionSlider = cp5.addSlider("REPULSION")
    .setPosition(10, 40)
    .setRange(0, min(width, height))
    .setSize(100, 40)
    .setValue(220);

  viscositySlider = cp5.addSlider("VISCOSITY")
    .setPosition(10, 120)
    .setRange(0, 1)
    .setSize(100, 40)
    .setValue(0.1);

  size(1280, 700);
  //fullScreen();
  strokeWeight(3);
}

void draw() {
  repulsion = repulsionSlider.getValue();
  viscosity = viscositySlider.getValue();

  background(20);

  if (theSwarm.size()>250) { //it gets laggy when the number of wobblers go up, to me
    theSwarm.remove(0);  //it gets obvious at about 250, feel free to adjust this
  } //                          number to your needs

  for (Wobbler i : theSwarm) {
    i.updateVel(theSwarm); //update the velocity but dont move them yet
  }

  for (Wobbler i : theSwarm) { //move them after all of them got their proper velocity
    i.updatePos();
    i.display();
  }
}

class Wobbler {
  PVector pos;
  PVector vel;
  float mass;
  boolean polar;

  Wobbler(PVector pos, float mass, boolean polar) {
    this.pos = pos;
    this.mass = mass;
    this.vel = new PVector(0, 0);
    this.polar = polar;
  }


  void updateVel(ArrayList<Wobbler> allWobbler) {
    PVector accel = new PVector(0, 0);

    for (Wobbler i : allWobbler) {
      if (i == this) continue; //skip itself
      float distance = this.pos.dist(i.pos);
      accel.add( // accelerate
        PVector.sub(i.pos, this.pos).normalize().mult((distance-repulsion) * i.mass) //direction towar the other wobblers
        );
    }
    //1-Math.pow(viscosity, 3) is the friction, slowing velocity down as time passes
    this.vel = this.vel.mult(1-pow(viscosity, 3)).add(accel.mult(this.mass));
  }

  void updatePos() {
    this.pos.add(this.vel);
  }

  void display() {
    if (this.polar) {
      noStroke(); //filled
      fill(235);
    } else {
      noFill(); //outlines
      stroke(235);
    }

    circle(this.pos.x, this.pos.y, this.mass*1000);
  }
}

void addWobbler() {
  if (mouseX<200&&mouseY<150) return; //protect the sliders
  theSwarm.add(
    new Wobbler(new PVector(mouseX, mouseY),
    random(0.003, 0.03), round(random(1)) == 1? true:false)
    );
}

void mouseClicked() {
  addWobbler();
}

void mouseDragged() {
  addWobbler();
}
