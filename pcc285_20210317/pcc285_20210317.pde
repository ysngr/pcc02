/* 285_20210317 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 400; i++ ) {
    narcs(random(width), random(height), random(80, 320));
  }
}


void narcs(float x, float y, float d) {

  final color[] cs = {
    color( 80, 124, 144), 
    color( 87, 100, 116), 
    color( 17,  18,  22), 
    color( 63,  77, 159), 
    color(228, 244, 251), 
    color( 80, 115,  65), 
    color(231,  97,  52), 
    color(201,  49,  40), 
    color(242, 216,  80)
  };
  final float pa = 0.5;
  final float dt = PI / 128;

  int n;
  float v, h, st, et;

  n = (int)random(200, 1000);
  v = random(0.8, 1.2) * d;
  h = random(0.8, 1.2) * d;
  st = random(-PI, PI);
  et = st + random(TWO_PI);

  stroke(cs[(int)random(cs.length)], random(20));
  noFill();

  for ( int i = 0; i < n; i++ ) {
    arc(x, y, v, h, st, et);
    x += d(pa);
    y += d(pa);
    v += d();
    h += d();
    st += d(dt);
    et += d(dt);
  }

  return ;
}


float d() {
  return random(-1, 1);
}

float d(float a) {
  return a * random(-1, 1);
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("285.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
