/* 278_20210305 */

PVector[] ps;


void setup() {
  size(1150, 800);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(0);
  initPoints();
  dotPoints();
  nwave();
}


void initPoints() {

  ps = new PVector[40];

  for ( int i = 0; i < ps.length; i++ ) {
    ps[i] = new PVector(random(width), random(height), random(10, 80));
  }

  return ;
}


void dotPoints() {

  final color[] cs = {
    color(123, 159, 211), 
    color( 74, 148, 191), 
    color( 37,  92, 142)
  };

  noStroke();

  for ( int i = 0; i < ps.length; i++ ) {
    fill(( i % 10 == 0 )? color(255, 0, 0) : cs[(int)random(cs.length)]);
    circle(ps[i].x, ps[i].y, 2*ps[i].z);
  }

  return ;
}


void nwave() {

  final color[] cs = {
    color(167,  55, 106), 
    color(196, 117, 144), 
    color(219,  78, 120), 
    color(221, 107,  71), 
    color(234, 153, 135), 
    color(229, 185, 147), 
    color(212,  62, 113), 
    color(125,   0,  74), 
    color(117,  55,  64)
  };
  final float A = 180;

  float y;

  for ( float h = -A; h < height+A; h++ ) {
    stroke(cs[(int)random(cs.length)], 180);
    for ( float w = 0; w < width; w++ ) {
      y = h + A * (noise(10*w/width, 10*h/height) - 0.5); 
      if ( isInCircle(w, y) ) {
        continue;
      }
      point(w, y);
      if ( random(100000) < 1 ) {
        noiseSeed((long)random(9999));
      }
    }
  }

  return ;
}


boolean isInCircle(float x, float y) {

  for ( int i = 0; i < ps.length; i++ ) {
    if ( dist(x, y, ps[i].x, ps[i].y) < 0.8*ps[i].z ) {
      return true;
    }
  }

  return false;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("278.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
