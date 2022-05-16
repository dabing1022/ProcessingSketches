let soundFile;
let Sound,amp,fft

function setup() {
  let canvas = createCanvas(400, 400);
  
  amp = new p5.Amplitude();
  fft = new p5.FFT();
  frameRate(20);

  Sound=canvas.drop(gotFile);
}

function gotFile(file) {
  if (soundFile) {
    soundFile.remove();
  }
  soundFile = createAudio(file.data);
  soundFile.autoplay(true);
  
  amp.setInput(soundFile);
}

function draw() {
  background(220);
  let level = amp.getLevel();
  let r = map(level,0,1,0,150);
  fill(random(255),80,80);
  ellipse(width/2,height/2,r,r);

  let waveform = fft.waveform();
  noFill();
  stroke(255,80,80,60);
  strokeWeight(2);
  for(let i=0;i<waveform.length;i++){
    //let x = map(i,0,waveform.length,0,width);
    //let y = map(waveform[i],-1,1,0,400);
    let angle = map(i,0,1024,0,360);
    x = width/2 + cos(angle) * 360;
    y = height/2 + sin(angle) * 360;
    let r = map(waveform[i],-0.8,0.8,50,220);
    x1 = width/2 + cos(angle) * r;
    y1 = height/2 + sin(angle) * r;
    line(x,y,x1,y1);
}
}
