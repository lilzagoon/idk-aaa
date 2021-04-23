// line(15, 25, 70, 90);
 
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;
AudioPlayer player2;

AudioBuffer buffer;
AudioInput ai;
AudioBuffer ab;

float lerpedAverage = 0;

float[] lerpedBuffer;
int[] button = new int [5];



float x = 0;
float c = 0;
int Mode;

float halfHeight;

FFT fft;

void setup()
{
  size(512, 512,P2D);
  colorMode(HSB);
  minim = new Minim(this);
  player = minim.loadFile("crabrave.mp3", width);
  player2= minim.loadFile("Etherwood.mp3", width);
 player.play();

  ai = minim.getLineIn(Minim.MONO, width, 44100, 16);
  buffer = player.left;
  ab = ai.mix;
 button[0] =  400;
button[1] =  400;
button[2] =  200;
button[3] =  50;
button[4] =  0;
  
   fft = new FFT(width, 44100);
  
  halfHeight = height/2;

  lerpedBuffer = new float[buffer.size()];
}

int which = 0;


 float lerpedFreq = 0;
 
void draw()
{
  

  
    fft.window(FFT.HAMMING);
  fft.forward(ab);
  int highestBin =-1;
  float highest = 0;
  
  
  if (which == 0)
  {
    for (int i = 0; i < buffer.size(); i ++)
    {

      stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
      lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
      float sample = lerpedBuffer[i] * width * 2;    
      stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
      line(i, height / 2 - sample, i, height/2 + sample);
    }
  }

  if (which == 1);
  {
    Mode1();
  }
  if (which ==2)
  {
    Mode2();
  }
  if (which == 3)
  {
    Mode3();
  }
  if (which ==4)
  {
    Mode4();
  }
  if (which ==5)
  {
    Mode5();
  }
  if (which ==6)
  {
    Mode6();
  }
   if (which ==7)
  {
    Mode7();
  }
   
   if (which ==8)
  {
    Mode8();
  }
}

void mousePressed()
{
  if(mouseY <(button[1] + button[3])){
   rect(30,30,20,20); 
   player.pause();
   player2.play();

  }
  
  
  
}
void Mode1()
{
  background(0);
  
  rect(button[0], button[1], button[2], button[3]);
  
  
  
  
  float halfH = height / 2;

  strokeWeight(1);
  for (int i = 0; i < buffer.size(); i ++)
  {

    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
    lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
    float sample = lerpedBuffer[i] * width * 2;    
    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
    line(i, height/2 -sample, height/2 +sample, i);
  }
}
void Mode2()
{
  background(0);
  float halfH = height / 2;

  strokeWeight(1);
  for (int i = 0; i < buffer.size(); i ++)
  {

    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
    lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
    float sample = lerpedBuffer[i] * width * 2;    
    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
    line(i, height/2 -sample, i, height/2 +sample/2);
  }
}
void Mode3()
{
  background(0);
  float halfH = height / 2;

  strokeWeight(1);
  for (int i = 0; i < buffer.size(); i ++)
  {

    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
    lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
    float sample = lerpedBuffer[i] * width * 2;    
    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
    line(width/2 -sample/2-256, i, width/2 +sample/2-256, i);
    line(width/2 -sample/2+256, i, width/2 +sample/2+256, i);
    line(i, height/2 -sample+256, i, height/2 +sample/2+256);
    line(i, height/2 -sample-256, i, height/2 +sample/2-256);
  }
}


void Mode4()
{
  background(0);
  float halfH = height / 2;

  strokeWeight(1);
  for (int i = 0; i < buffer.size(); i ++)
  {

    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
    lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
    float sample = lerpedBuffer[i] * width * 2;    
    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);

    if ( c>= 255)
    {
      c=0;
    }
    stroke(255, 255, 255);
    fill(0);
    c ++;
    
    
    ellipse(width/ 2, 256, lerpedAverage * height/2*4, lerpedAverage * height/2*4);

    float sum = 0;
    for (int i1 = 0; i1 < buffer.size(); i1 ++)
    {
      sum += abs(buffer.get(i1));
    }

    noStroke();
    float average = sum / buffer.size();
    lerpedAverage = lerp(lerpedAverage, average, 0.1f);
  }
}

void Mode5()
{
  background(0);
  float halfH = height / 2;

  strokeWeight(1);
  for (int i = 0; i < buffer.size(); i ++)
  {

    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
    lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
    float sample = lerpedBuffer[i] * width * 2;    
    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
    
    if ( c>= 255)
    {
      c=0;
    }
    stroke(c/2, 255/2, 255);
    fill(0);
    c ++;
    
    
    rectMode(CENTER);
    rect(width/ 2, 256, lerpedAverage * height*2, lerpedAverage * height*2);
    
    
    float sum = 0;
    for (int i1 = 0; i1 < buffer.size(); i1 ++)
    {
      sum += abs(buffer.get(i1));
    }

    noStroke();
    float average = sum / buffer.size();
    lerpedAverage = lerp(lerpedAverage, average, 0.1f);
  }
}

void Mode6()
{
  background(0);
  float halfH = height / 2;

  strokeWeight(1);
  for (int i = 0; i < buffer.size(); i ++)
  {

    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
    lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
    float sample = lerpedBuffer[i] * width * 2;    
    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);

    rectMode(CENTER);
    line(width/2 -sample/2-256, i, width/2 +sample/2-256, i);
    line(width/2 -sample/2+256, i, width/2 +sample/2+256, i);
    line(i, height/2 -sample+256, i, height/2 +sample/2+256);
    line(i, height/2 -sample-256, i, height/2 +sample/2-256);
    
    line(width/2 -sample/2-128, i, width/2 +sample/2-128, i);
    line(width/2 -sample/2+128, i, width/2 +sample/2+128, i);
    line(i, height/2 -sample+128, i, height/2 +sample/2+128);
    line(i, height/2 -sample-128, i, height/2 +sample/2-128);

    float sum = 0;
    for (int i1 = 0; i1 < buffer.size(); i1 ++)
    {
      sum += abs(buffer.get(i1));
    }

    noStroke();
    float average = sum / buffer.size();
    lerpedAverage = lerp(lerpedAverage, average, 0.1f);
  }
}
void Mode7()
{
  background(0);
  for(int i = 0;i < ab.size(); i++)
  {
    float c = map(i,0,ab.size(),0,255);
    stroke(c, 255,255);
    float sample = ab.get(i) * halfHeight;
    line(i, halfHeight + sample, i, halfHeight - sample); 
     line(i, 0 + sample, i, 0 - sample); 
     line(i, height + sample, i, height - sample); 
  }
  
  fft.window(FFT.HAMMING);
  fft.forward(ab);

  


  }

void Mode8()
{
  background(0);
  for(int i = 0;i < ab.size(); i++)
  {
    float c = map(i,0,ab.size(),0,255);
    stroke(c, 255,255);
    float sample = ab.get(i) * halfHeight;
    line(i, halfHeight + sample, i, halfHeight - sample); 
  }
  
  fft.window(FFT.HAMMING);
  fft.forward(ab);
  int highestBin =-1;
  float highest = 0;
  
  for(int i = 0; i < fft.specSize(); i ++)
  {
     float c = map(i,0,ab.size(),0,255);
    stroke(c, 255,255);
    line(i,0,i, fft.getBand(i) * halfHeight);
    if (fft.getBand(i) > highest)
    {
     highest = fft.getBand(i); 
     highestBin = i;
    }
  }
  noStroke();
  float freq = fft.indexToFreq(highestBin);
  lerpedFreq = lerp(lerpedFreq, freq, 0.1f);
  float y = map(lerpedFreq, 900, 2100, height, 0);
  ellipse(100, y, 50, 50);
  }


void keyPressed()
{
  // Set the value of which based on which key was pressed
  if (keyCode >= '0' && keyCode <= '8')
  {
    which = keyCode - '0';
  }
  if (keyCode == ' ')
  {
    if ( player.isPlaying() )
    {
      player.pause();
    } else
    {
      player.rewind();
      player.play();
    }
  }
}
