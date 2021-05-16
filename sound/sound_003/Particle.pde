class Particle {
  float radian;
  float radius;
  float strokeWeight;
  float preRadian;
  float speed;
  
  Particle(float radian, float radius) {
    this.radian = radian;
    this.radius = radius;
    this.strokeWeight = random(2, 10);
    this.speed = random(0.01, 0.1);
  }
  
  void update(float level) {
    this.preRadian = this.radian;
    this.radian += this.speed * level * 8;
  }
  
  void display(float level) {
    //stroke(255, 255, 255, map(level, 0, 1, 220, 255));
    stroke(random(255), random(255), random(255), map(level, 0, 1, 220, 255));
    strokeWeight(this.strokeWeight * level * 12);
    noFill();
    
    arc(width / 2, height / 2, this.radius, this.radius, this.preRadian, this.radian);
  }
}
