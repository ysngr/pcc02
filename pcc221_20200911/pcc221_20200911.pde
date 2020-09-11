/* 221_20200911 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(33, 22, 10);
  for ( int i = 0; i < 10; i++ ) {
    decircle(random(width), random(height), random(260, 380));
  }
  for ( int i = 0; i < 20; i++ ) {
    rotSquare(random(width), random(height), random(60, 120));
  }
  for ( int i = 0; i < 10; i++ ) {
    decircle(random(width), random(height), random(260, 380));
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


void rotSquare(float x, float y, float d) {

  final color[] cs = {
    color(214, 176,  93), 
    color( 52, 114, 161), 
    color(161, 168, 174), 
    color(141, 156, 160)
  };

  float r, t, dt, divt, a;
  int idx = (int)random(cs.length);

  r = 0;
  t = random(-PI, PI);
  dt = PI/256 * (( random(2) < 1 )? -1 : 1); 
  divt = random(1, 4);
  a = random(160, 220);

  noFill();

  while ( a > 0 ) {
    stroke(cs[idx], a);
    pushMatrix();
    translate(x+d/2*cos(t), y+d/2*sin(t));
    rotate(t/divt);
    square(0, 0, r);
    popMatrix();
    r++;
    t += dt;
    a -= random(1.4);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("221.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
