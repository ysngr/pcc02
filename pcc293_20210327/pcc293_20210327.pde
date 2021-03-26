/* 293_20210327 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  translate(0, height/2);
  for ( int i = 0; i < 2; i++ ) {
    for ( float h = -height/4; h < height/4; h++ ) {
      wave(h);
    }
  }
}


void wave(float h) {

  final color[] cs = {
    color(244, 246, 241), 
    color(242, 243, 234), 
    color(220, 221, 210), 
    color( 87,  98, 105), 
    color(135, 121, 109), 
    color(202, 196, 172), 
    color( 57,  51,  44), 
    color(197, 151,  99), 
    color(148, 100,  53)
  };
  final float A = 160;

  stroke(cs[(int)random(cs.length)], 200);
  if ( random(10) < 1 ) {
    noiseSeed((long)random(9999));
  }

  for ( float w = 0; w < width; w++ ) {
    point(w, h+A*(noise(10*w/width, h/height) - 0.5));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("293.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
