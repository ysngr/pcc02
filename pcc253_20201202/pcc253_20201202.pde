/* 253_20201202 */

void setup() {
  size(1150, 800);
  background(240);
  noLoop();
  noiseSeed(247);
  noFill();
}


void draw() {
  final int ITIMES = 320;
  for ( int i = 0; i < ITIMES; i++ ) {
    stroke(( random(5) < 1 )? color(240, 20) : color(9, 158, 214, 60));
    beginShape();
    for ( float t = 0; t < 4*TWO_PI; t += PI/256 ) {
      float r = 460 * noise((float)i/ITIMES, t);
      vertex(width/2+r*cos(t), height/2+r*sin(t));
    }
    endShape();
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("253.png");
    exit();
  }
}
