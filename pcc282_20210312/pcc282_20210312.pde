/* 282_20210312 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 140; i++ ) {
    partArc(random(width), random(height), random(60, 240));
  }
}


void partArc(float x, float y, float mr) {

  final color[] cs = {
    color( 70,  61, 149), 
    color(231,  62, 112), 
    color( 66, 123, 191), 
    color(251, 251, 251), 
    color(175, 200, 232), 
    color(196, 221, 241), 
    color(108, 149,  70), 
    color( 63,  54,  27), 
    color(137, 164, 178)
  };
  final float[] ts = {0, HALF_PI, PI, 3*HALF_PI};
  final float dt = PI / 512;

  float st = ts[(int)random(ts.length)];
  float sw = random(2);
  float dsw = random(0.005);

  pushMatrix();
  translate(x, y);

  for ( float r = 0; r < mr; r += 0.7*sw ) { 
    stroke(cs[(int)random(cs.length)], 20);
    for ( float t = st; t < st+HALF_PI; t += dt ) {
      strokeWeight(sw);
      point(r*cos(t), r*sin(t));
      sw += dsw;
    }
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("282.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
