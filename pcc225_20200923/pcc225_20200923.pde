/* 225_20200923 */

final color[] cs = {
  color(218,  65,  72), 
  color(208,  15,  49), 
  color(165,  26,  41), 
  color( 68,  81,  54), 
  color( 33,  22,  10), 
  color(255, 240, 193), 
  color(240, 208, 129), 
  color(231, 168,  73)
};


void setup() {
  size(1150, 800);
  noLoop();
  rectMode(CENTER);
}


void draw() {
  background(33, 22, 10);
  for ( int i = 0; i < 40; i++ ) {
    fsquare(random(width), random(height), random(20, 60));
  }
  for ( int i = 0; i < 25; i++ ) {
    decircle(random(width), random(height), random(320, 480));
  }
  for ( int i = 0; i < 100; i++ ) {
    flow(random(width), random(height), (int)random(400, 2000));
  }
  for ( int i = 0; i < 8; i++ ) {
    fcircle(random(width), random(height), random(20, 80));
  }
}


void decircle(float x, float y, float d) {

  final color[] cs = {
    color(218,  65,  72), 
    color(208,  15,  49), 
    color(165,  26,  41), 
    color( 68,  81,  54), 
    color( 33,  22,  10), 
    color(255, 240, 193), 
    color(240, 208, 129), 
    color(231, 168,  73)
  };

  float r = d / 2;
  int idx = (int)random(cs.length);

  noStroke();
  while ( r > 0 ) {
    fill(cs[idx], 4);
    circle(x+random(-1, 1), y+random(-1, 1), 2*r);
    r -= random(0.75, 1.25);
  }

  return ;
}


void fsquare(float x, float y, float l) {

  final color[] cs = {
    color(214, 176,  93), 
    color( 52, 114, 161), 
    color(161, 168, 174), 
    color(141, 156, 160)
  };

  noStroke();
  fill(cs[(int)random(cs.length)], 120);
  square(x, y, l);

  return ;
}


void flow(float cx, float cy, int n) {

  float x, y, a, t, sw;

  x = cx;
  y = cy;
  a = 1.2;
  sw = 1;

  if ( random(50) < 1 ) {
    noiseSeed((long)random(9999));
  }
  stroke(cs[(int)random(cs.length)], 80);

  for ( int i = 0; i < n; i++ ) {
    if ( x < 0 || width <= x || y < 0 || height <= y ) {
      break;
    }
    strokeWeight(sw);
    point(x, y);
    t = 15 * noise(x/width, y/height);
    x += a * cos(t);
    y += a * sin(t);
    sw += random(0.01);
  }

  return ;
}


void fcircle(float x, float y, float d) {

  noStroke();
  fill(35, 194, 232, 160);
  circle(x, y, d);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("225.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
