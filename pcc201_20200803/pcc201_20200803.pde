/* 201_20200803 */

PVector[] ps;

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  dcircles(5);
  initPoints();
  for ( float h = 0; h < height; h += random(0.2, 2.8) ) {
    wave(h);
    if ( random(200) < 1 ) {
      dcircles(1);
    }
  }
  dcircles(2);
}


void initPoints() {

  ps = new PVector[18];

  for ( int i = 0; i < ps.length; i++ ) {
    ps[i] = new PVector(random(width), random(height), random(40, 120));
  }

  return ;
}


void wave(float sh) {

  final color[] cs = {
    color(  0, 165, 213), 
    color( 89, 195, 225), 
    color(161, 216, 225), 
    color( 76, 187, 180), 
    color(134, 202, 182), 
    color(230, 229, 215), 
    color( 91, 164, 105), 
    color(250, 238, 222), 
    color(247, 242, 244)
  };

  float h;
  float a = map(noise(sh/height), 0, 1, 20, 30);
  float t = map(noise(sh/height), 0, 1, -PI, PI);
  float dt = map(noise(sh/height), 0, 1, PI/128, PI/64);

  strokeWeight(map(noise(sh/height), 0, 1, 1.6, 3.2));
  stroke(cs[(int)random(cs.length)]);

  t = 0;
  for ( float w = 0; w < width; w++ ) {
    h = sh + a*cos(t);
    while ( isInCircle(w, h) ) {
      point(w++, h);
    }
    point(w, h);
    t += dt;
  }

  return ;
}


boolean isInCircle(float x, float y) {

  for ( PVector p : ps ) {
    if ( dist(x, y, p.x, p.y) < p.z ) {
      return true;
    }
  }

  return false;
}


void dcircles(int n) {

  blendMode(SUBTRACT);

  noStroke();
  for ( int i = 0; i < n; i++ ) {
    fill(21, 162, 120);
    circle(random(width), random(height), random(80, 180));
  }

  blendMode(BLEND);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("201.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
