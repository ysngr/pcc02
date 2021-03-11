/* 281_20210312 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 320; i++ ) {
    partArc(random(width), random(height), random(40, 380));
  }
}


void partArc(float x, float y, float mr) {

  final color[] cs = {
    color(218,  65,  72), 
    color(208,  15,  49), 
    color(165,  26,  41), 
    color( 79,  53,  39), 
    color( 68,  81,  54), 
    color( 33,  22,  10), 
    color(255, 240, 193), 
    color(240, 208, 129), 
    color(231, 168,  73)
  };
  final float[] ts = {0, HALF_PI, PI, 3*HALF_PI};
  final float dt = PI / 512;

  float st = ts[(int)random(ts.length)];
  float sw = random(1, 4);
  float dsw = random(0.05);

  pushMatrix();
  translate(x, y);

  stroke(cs[(int)random(cs.length)], 20);

  for ( float r = 0.8*mr; r < mr; r += sw ) { 
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
    saveFrame("281.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
