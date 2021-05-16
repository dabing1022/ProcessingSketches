import processing.sound.*;

AudioIn in;
Waveform waveform;  //波形分析器

int samples = 30;  //波形样本数量

public void setup() {
  size(369, 369);
  colorMode(HSB,360,100,100);

  in = new AudioIn(this, 0);
  in.play();

  waveform = new Waveform(this, samples);
  waveform.input(in); 
}

public void draw() {
  background(0);  

  waveform.analyze();
  translate(-30,0);
  beginShape();
  for(int i = 0; i < samples; i++){
    stroke(waveform.data[i] +250,81,81);
    strokeWeight(random(20));
    noFill();
    vertex(
      map(waveform.data[i], -1, 1, 0, height),
      map(i, 0, samples, 0, width) 
    );
  }
  endShape();
}
