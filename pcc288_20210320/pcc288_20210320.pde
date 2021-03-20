/* 288_20210320 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(ADD);
}


void draw() {
  background(0);
  for ( int i = 0; i < 28; i++ ) {
    ncircle(random(width), random(height), random(320, 480));
  }
}


void ncircle(float x, float y, float d) {

  final color[] cs = {
    color(122, 116, 124), 
    color(233, 210, 223), 
    color( 20,  45,  41), 
    color(174, 124, 103), 
    color(198, 199, 206), 
    color(247, 185, 129), 
    color(232, 109, 116), 
    color(245, 243, 238), 
    color(229,  83, 107)
  };
  final float RA = 50;
  final float dt = PI / 128;

  float nr, st;

  st = random(-PI, PI);

  noiseSeed((long)random(9999));
  stroke(cs[(int)random(cs.length)], random(10, 30));
  noFill();

  for ( float r = 0; r < d/2; r += 0.25 ) {
    beginShape();
    for ( float t = st; t < st+TWO_PI; t += dt ) {
      nr = r + RA * (noise(x*y, r/500*t) - 0.5);
      vertex(x+nr*cos(t), y+nr*sin(t));
    }
    endShape(CLOSE);
    st += 0.5 * dt;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("288.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
