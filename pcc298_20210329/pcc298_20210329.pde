/* 298_20210329 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 1000; i++ ) {
    moon(random(width), random(height), random(50, 150));
  }
  for ( int i = 0; i < 20; i++ ) {
    moon(random(width), random(height), random(200, 400));
  }
}


void moon(float x, float y, float d) {

  final color[] cs = {
    color(252, 225,  94), 
    color(215, 192,  68), 
    color(226, 226, 227), 
    color(153, 153, 153), 
    color(182, 184, 196), 
    color(245, 249, 252), 
    color(134, 157, 184), 
    color( 92, 115, 142), 
    color( 88,  83,  74)
  };

  int n;
  float dx, et;

  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));
  stroke(cs[(int)random(cs.length)], 20);
  noFill();

  n = (int)random(100, 600);
  dx = 0;
  et = PI;

  for ( int i = 0; i < n; i++ ) {
    arc(dx, dy, d, d, 0, et);
    dx += random(-1, 1);
    et += random(-1, 1) * PI / 32;
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("298.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
