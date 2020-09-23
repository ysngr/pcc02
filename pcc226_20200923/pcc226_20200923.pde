/* 226_20200923 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(220);
  for ( int i = 0; i < 6; i++ ) {
    nhole(random(width), random(height), random(320, 480));
  }
  for ( int i = 0; i < 32; i++ ) {
    nhole(random(width), random(height), random(40, 240));
  }
}


void nhole(float x, float y, float d) {

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
  final float dt = PI / 128;

  float mr = d / 10;
  float r = d / 2;

  noiseSeed((long)random(9999));
  noStroke();
  fill(cs[(int)random(cs.length)], 10);

  while ( mr < d ) {
    beginShape();
    for ( float t = 0; t < TWO_PI; t+=dt ) {
      r = d/2 + mr * noise((x+d/2*cos(t))/100, (y+d/2*sin(t))/100);
      vertex(x+r*cos(t), y+r*sin(t));
    }
    beginContour();
    r = d / 2;
    for ( float t = TWO_PI; t > 0; t-=dt ) {
      vertex(x+r*cos(t), y+r*sin(t));
    }
    endContour();
    endShape(CLOSE);
    mr += random(2, 8);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("226.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
