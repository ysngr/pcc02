/* 273_20210303 */

void setup() {
  size(1150, 800);
  noLoop();
  strokeCap(PROJECT);
  rectMode(CENTER);
}


void draw() {
  background(32, 20, 10);
  for ( int i = 0; i < 48; i++ ) {
    pendulumArea(random(width), random(height), random(60, 360));
  }
}


void pendulumArea(float x, float y, float l) {

  final color[] cs = {
    color(218,  65,  72), 
    color(208,  15,  49), 
    color(165,  26,  41), 
    color( 79,  53,  39), 
    color( 68,  81,  54), 
    color(231, 168,  73), 
    color(166, 111, 167), 
    color(131,  92, 143)
  };

  int n;
  float sx, sy, ex, ey;

  strokeWeight(random(2, 8));
  stroke(cs[(int)random(cs.length)]);
  noFill();
  square(x, y, l);

  n = (int)random(3, 6);
  for ( int i = 0; i < n; i++ ) {
    if ( random(2) < 1 ) {
      sx = x + (( random(2) < 1 )? -0.5 : 0.5) * l;
      sy = y + random(-0.2, 0.2) * l;
    } else {
      sx = x + random(-0.2, 0.2) * l;
      sy = y + (( random(2) < 1 )? -0.5 : 0.5) * l;
    }
    ex = x + random(-0.2, 0.2) * l;
    ey = y + random(0.2, 0.2) * l;

    strokeWeight(random(1.0, 2.5));
    line(sx, sy, ex, ey);
    fill(cs[(int)random(cs.length)], 200);
    circle(ex, ey, random(20, 40));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("273.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
