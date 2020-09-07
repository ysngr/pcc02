/* 218_20200907 */

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


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(238, 236, 235);
  for ( int i = 0; i < 12; i++ ) {
    slines();
  }
  for ( int i = 0; i < 60; i++ ) {
    orbit();
  }
}


void orbit() {

  final float dt = PI / 1024;

  float x, y, a, b, d, sw;
  int n, idx;

  n = (int)random(1, 8);
  d = random(80, 240);

  pushMatrix();
  translate(random(width), random(height));

  for ( int i = 0; i < n; i++ ) {
    a = random(0.5, 0.9) * d;
    b = random(0.1, 0.4) * d;
    sw = random(1.0, 2.6);
    idx = (int)random(cs.length);
    strokeWeight(sw+random(-0.2, 0.2));
    stroke(cs[idx]);
    fill(cs[idx]);
    rotate(random(-PI/4, PI/4));
    for ( float t = 0; t < TWO_PI; t += dt ) {
      x = a * cos(t);
      y = b * sin(t);
      point(x, y);
      if ( random(200) < 1 ) {
        circle(x, y, random(0.025, 0.08)*d);
      }
    }
  }

  popMatrix();

  return ;
}


void slines() {

  final float L = mag(width, height);

  float dx, dy, cx, cy, t;

  dx = 80 * random(-1, 1);
  dy = 80 * random(-1, 1);
  cx = width/2 + dx;
  cy = height/2 + dy;
  t = random(-PI, PI);

  strokeWeight(random(1.2, 3.2));
  stroke(cs[(int)random(cs.length)], 120);
  line(cx+L*cos(t), cy+L*sin(t), cx+L*cos(t+PI), cy+L*sin(t+PI));

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("218.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
