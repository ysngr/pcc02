/* 246_20201113 */

void setup() {
  size(1150, 800);
  noLoop();
  noiseSeed(7869);
}


void draw() {
  background(255, 252, 242);
  for ( int i = 0; i < 6; i++ ) {
    fdot(random(width), random(height));
  }
  for ( int i = 0; i < 400; i++ ) {
    iwave(random(height));
  }
  for ( int i = 0; i < 4; i++ ) {
    fdot(random(width), random(height));
  }
  for ( int i = 0; i < 200; i++ ) {
    rslash();
  }
}


void iwave(float h) {

  final color[] cs = {
    color(243, 226, 207), 
    color(227, 205, 186), 
    color(227, 240, 250), 
    color(190, 204, 221), 
    color(157, 174, 189), 
    color(193, 185, 179), 
    color(154, 139, 125), 
    color(123,  97,  84)
  };

  float a, t, sw, da, dt, dsw;

  a = 0;
  t = 0;
  sw = 2;
  da = 0.2 * noise(h/height);
  dt = PI/64 * noise(2*h/height);
  dsw = 0.02 * da;

  stroke(cs[(int)random(cs.length)], 160);

  for ( float w = 0; w < width; w++ ) {
    strokeWeight(sw);
    point(w, h+a*cos(t));
    a += da;
    t += dt;
    sw += dsw;
  }

  return ;
}


void fdot(float x, float y) {

  noStroke();
  fill(222, 113, 21);
  circle(x, y, 160*(x/width+abs(y-height/2)/height));

  return ;
}


void rslash() {

  final float D = 200;
  final float r = width + D;

  float t;

  pushMatrix();
  translate(width/2+D*random(-1, 1), height/2+D*random(-1, 1));
  rotate(random(-PI, PI));

  t = random(-PI, PI);
  strokeWeight(0.8);
  stroke(255, 252, 242, 100);
  line(r*cos(t), r*sin(t), r*cos(t+PI), r*sin(t+PI));

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("246.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
