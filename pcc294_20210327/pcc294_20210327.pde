/* 294_20210327 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 100; i++ ) {
    wave(random(width), random(height), random(80, 320));
  }
}


void wave(float x, float y, float a) {

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

  float d, t, dt, dx, ddx, da;

  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));
  stroke(0, 120);
  fill(cs[(int)random(cs.length)]);

  d = random(20);
  t = random(-PI, PI);
  dt = PI / random(32, 128);
  dx = 0;
  ddx = random(-1, 1);
  da = random(1);

  while ( a > 0 ) {
    circle(dx, a*cos(t), d);
    a -= da;
    dx += ddx;
    t += dt;
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("294.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
