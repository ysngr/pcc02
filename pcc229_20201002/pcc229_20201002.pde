/* 229_20201002 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(222, 221, 225);
  for ( int i = 0; i < 24; i++ ) {
    nRing(random(0.25, 0.75)*width, random(0.3, 0.7)*height, random(60, 180));
  }
}


void nRing(float cx, float cy, float d) {

  final color[] cs = {
    color(149, 155, 169), 
    color( 94, 101, 102), 
    color(211, 210, 191), 
    color( 36,  49,  70), 
    color( 62,  87, 112), 
    color(217, 117,  86), 
    color(241, 173,  95), 
    color(225, 198, 192), 
    color(224, 140, 122)
  };

  int n, idx;
  float x, y, dt, at;
  boolean isPiExceeded;

  idx = (int)random(cs.length);
  strokeWeight(random(1, 2));
  stroke(cs[idx]);
  noFill();

  n = (int)random(2, 8);
  for ( int i = 0; i < n; i++ ) {
    circle(cx, cy, (1+0.1*i)*d);
  }

  isPiExceeded = false;
  at = random(2, 8);
  stroke(cs[idx], random(60, 180));

  for ( float t = 0; t < TWO_PI; t += random(PI/64, PI/32) ) {
    if ( !isPiExceeded && t > PI ) {
      isPiExceeded = true;
      noiseSeed((long)random(9999));
    }
    n = (int)random(120, 480);
    x = cx + d/2 * cos(t);
    y = cy + d/2 * sin(t);
    for ( int i = 0; i < n; i++ ) {
      point(x, y);
      dt = at * noise(x/320, y/320);
      x += cos(dt);
      y += sin(dt);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("229.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
