import processing.sound.*;

AudioIn in;
Amplitude ampl;

float x;

void setup() {
  size(900, 900, P2D);
  background(255);
  colorMode(HSB, 360, 100, 100);

  in = new AudioIn(this, 0);
  in.play();

  ampl = new Amplitude(this);
  ampl.input(in);
}

void draw() {
  //background(255);
  float v = ampl.analyze() * 800;

  stroke(v, 81, 81);
  translate(width/2, height/2);
  rotate(radians(x +=v));
  {
    //fill(v, 81, 81);
    //arc(0, 0, v * 2, v * 2, 0, v * 0.1, PIE);
  }
  
  rectMode(CENTER);
  rect(0, 0, v *2, v *2);
  //arc(0, 0, v *2, v *2, 0, HALF_PI);
  //arc(0, v *2, v *2, v *2, 0, HALF_PI);
  //arc(v *2, v *2, 0, v *2, 0, HALF_PI);
  //arc(v *2, v *2, v *2, v *2, 0, HALF_PI);
  //line(v *2, 20, 30, v *2);
  //quad(38,v *2,v *2, 20, 31, v *2, v *2, 33);
}
