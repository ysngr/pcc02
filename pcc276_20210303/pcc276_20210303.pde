/* 276_20210303 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 24; i++ ) {
    sunshine(random(width), random(height), random(60, 320));
  }
}


void sunshine(float x, float y, float d) {

  final color[] cs = {
    color( 39,  43,  87), 
    color( 38,  55, 130), 
    color( 84, 122, 170), 
    color(200, 211, 221), 
    color( 79,  94, 117), 
    color( 45,  44,  45), 
    color(233,  77,  71), 
    color(237, 111,   0), 
    color(251, 203, 114)
  };
  final float dt = PI / 256;

  float ir, or, st, et;

  noStroke();

  pushMatrix();
  translate(x, y);

  for ( int i = 0; i < 80; i++ ) {
    ir = random(d) / 2;
    or = ir + random(0.2) * d;
    st = random(-PI, PI);
    et = st + random(HALF_PI);
    fill(cs[(int)random(cs.length)], random(180, 240));
    beginShape();
    for ( float t = st; t < et; t += dt ) {
      vertex(ir*cos(t), ir*sin(t));
    }
    for ( float t = et; t > st; t -= dt ) {
      vertex(or*cos(t), or*sin(t));
    }
    endShape(CLOSE);
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("276.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
