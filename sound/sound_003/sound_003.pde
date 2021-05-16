import processing.sound.*;


AudioIn audioIn;
SoundFile soundFile;
Amplitude rms;

int particleCount = 100;
Particle[] particles;

void setup() {
  size(800, 800);
  background(0);
  
  audioIn = new AudioIn(this, 0);
  audioIn.play();
  
  //soundFile = new SoundFile(this, "beat.aiff");
  //soundFile.loop();
  
  rms = new Amplitude(this);
  rms.input(audioIn);
  //rms.input(soundFile);
  
  particles = new Particle[particleCount];

  for (int i = 0; i < particleCount; i++) {
    particles[i] = new Particle(random(width), random(height));
  }
}


void draw() {
  background(0);
  
  float level = rms.analyze() * 2.4;
  
  fill(255 * level);
  noStroke();
  circle(width / 2, height / 2, 253);
  
  for (int i = 0; i < particleCount; i++) {
    particles[i].update(level);
    particles[i].display(level);
  }
}
