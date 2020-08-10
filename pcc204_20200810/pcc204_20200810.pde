/* 204_20200810 */

void setup() {
  size(1150, 800);
  noLoop();
  rectMode(CENTER);
}


void draw() {
  sunset();  
  holes();
  tower(width-200, 550, 100);
  sun(0, 0, 700);
  mountain();
}


void sunset() {

  background(255);

  loadPixels();
  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      pixels[(int)(w+h*width)] = color(
        map(noise(w/600, h/500), 0, 1, 80, 180), 
        map(noise(w/200, h/300), 0, 1, 10,  50), 
        map(noise(w/400, h/400), 0, 1,  0,  50)
      );
    }
  }
  updatePixels();

  return ;
}


void holes() {

  final color[] cs = {
    color(231, 117,  52), 
    color(159,  33,  88), 
    color(190, 150, 110), 
    color(158, 140, 115), 
    color(134, 160, 190), 
    color(210, 190, 108)
  };

  float x, y, r;
  int idx;

  noFill();
  for ( int i = 0; i < 10; i++ ) {
    x = random(width);
    y = random(height);
    r = random(120, 220);
    idx = (int)random(cs.length);
    for ( float a = 60; a > 0; a -= random(1) ) {
      stroke(cs[idx], a);
      circle(x, y, r);
      r++;
    }
  }

  return ;
}


void tower(float x, float h, float dh) {

  fill(0);
  pushMatrix();
  translate(0, -dh);
  tower(x, h);
  translate(0, dh);
  popMatrix();

  return ;
}


void tower(float x, float h) {

  float dw = 2.2 * h / 7;
  float dh = h / 6;
  float y;

  noStroke();

  y = height - dh/2;
  for ( int i = 0; i < 5; i++ ) {
    rect(x, y, dw, dh);
    triangle(x, y-1.2*dh, x-dw, y, x+dw, y);
    y -= dh;
  }
  triangle(x, y-1.5*dh, x-dw/20, y+dh/10, x+dw/20, y+dh/10);

  return ;
}


void sun(float x, float y, float d) {

  float r;

  noStroke();
  fill(232, 79, 19, 2);
  for ( r = d / 2; r > 0.3*d; r -= 0.8 ) {
    circle(x+random(-1, 1), y+random(-1, 1), 2*r);
  }

  return ;
}


void mountain() {

  strokeWeight(1);
  stroke(0);

  float h = height - 250;
  for ( float w = 0; w < width; w++ ) {
    line(w, h+map(noise(5*w/width), 0, 1, -80, 50), w, height);
    h += random(0.2);
  }

  return ;
}


float tanh(float x) {
  return (exp(x) - exp(-x)) / (exp(x) + exp(-x));
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("204.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
