/* 279_20210309 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 380; i++ ) {
    partArc(random(width), random(height), random(40, 320));
  }
}


void partArc(float x, float y, float d) {

  final color[] cs = {
    color(218, 205, 139), 
    color(174, 154, 107), 
    color( 92, 118, 100), 
    color(  0, 126, 118), 
    color(248, 246, 222), 
    color(230, 224, 196), 
    color( 85, 125,  62), 
    color( 73,  49,  60), 
    color(235,  92,  50)
  };
  final float[] ts = {0, HALF_PI, PI, 3*HALF_PI};
  final float dt = PI / 512;

  float r;
  float st = ts[(int)random(ts.length)];

  pushMatrix();
  translate(x, y);

  strokeWeight(random(2, 32));
  stroke(cs[(int)random(cs.length)], 200);

  r = d / 2;
  for ( float t = st; t < st+HALF_PI; t += dt ) {
    point(r*cos(t), r*sin(t));
    r += random(-0.5, 1);
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("279.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
