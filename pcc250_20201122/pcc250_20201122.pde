/* 250_20201122 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  flower(width, 0, 1300, color(27, 161, 222));
  flower(width/3, 3*height/5, 280, color(237, 81, 50));
}


void flower(float x, float y, float d, color c) {

  float r, t;

  noiseSeed((long)random(9999));
  stroke(c, 40);
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



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("250.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
