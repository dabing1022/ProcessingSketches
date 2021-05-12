import ddf.minim.*;
import javax.sound.sampled.*;

Minim minim;
AudioInput in;

void setup()
{
  size(1024, 400);
  smooth();

  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 4 * 1024, 44100, 16);
  //in = minim.getLineIn(Minim.MONO);
  
  background(0);
}

void draw()
{
  fill(0, 5);
  rect(0, 0, width, height);
  noStroke();
  
  // draw the waveforms so we can see what we are monitoring
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    fill(abs(in.left.get(i)*255), 255, 0);
    ellipse(i, 120+in.left.get(i)*100, in.left.get(i)*6, in.left.get(i)*100);
  }
  
}

void stop()
{
  in.close();
  minim.stop();
  super.stop();
}
