/* 264_20200127 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(ADD);
}


void draw() {
  background(3, 20, 43);
  for ( int i = 0; i < 20; i++ ) {
    spiral(random(width), random(height), random(5, 25), random(160, 280), random(2, 10)*PI);
  }
}


void spiral(float x, float y, float r, float d, float mt) {

  final color[] cs = {
    color(173, 128, 175), 
    color(246, 237,  67), 
    color(244, 159,  58), 
    color( 78, 191, 213), 
    color(232,  68, 126), 
    color(182, 212,  88), 
    color(250, 250, 245), 
    color( 83,  78, 138)
  };

  float rr, rd, dr, dd;

  rr = random(1, 4);
  rd = random(1, 4);
  dr = random(60, 120);
  dd = random(60, 120);

  noiseSeed((long)random(9999));
  stroke(cs[(int)random(cs.length)], random(10, 20));
  noFill();

  for ( float t = 0; t < mt; t += PI/256 ) {
    r += rr * (noise(r/dr) - 0.5);
    d += rd * (noise(d/dd) - 0.5);
    circle(x+r*cos(t), y+r*sin(t), d);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("264.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
