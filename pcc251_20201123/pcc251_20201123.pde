/* 251_20201123 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);

  final color[] cs = {
    color(227, 236, 244), 
    color(112, 148, 192), 
    color( 56,  90, 158), 
    color(234, 235, 235), 
    color(212, 212, 211), 
    color( 51,  49, 115), 
    color(232, 211, 207), 
    color(204, 104, 117), 
    color(164, 125,  90)
  };

  dots();
  for ( color c : cs ) {
    flower(random(width), random(height), random(800, 1000), c);
  }
}


void flower(float x, float y, float d, color c) {

  float r, t;

  noiseSeed((long)random(9999));
  stroke(c, 20);
  noFill();

  for ( int i = 0; i < 200; i++ ) {
    if ( random(4) < 1 ) continue;
    beginShape();
    for ( t = 0; t < 9*PI; t += PI/256 ) {
      r = d * noise((float)i/200, t);
      vertex(x+r*cos(t), y+r*sin(t));
    }
    endShape();
  }

  return ;
}


void dots() {

  noStroke();
  fill(240, 80, 93, 200);

  for ( int i = 0; i < 24; i++ ) {
    circle(random(width), random(height), random(20, 40));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("251.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
