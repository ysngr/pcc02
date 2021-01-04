/* 261_20210104 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 38; i++ ) {
    stump(random(width), random(height), random(100, 320));
  }
}


void stump(float cx, float cy, float md) {

  final color[] cs = {
    color(149, 155, 169), 
    color( 94, 101, 102), 
    color(211, 210, 191), 
    color( 36,  49,  70), 
    color( 62,  87, 112), 
    color(217, 117,  86), 
    color(241, 173,  95), 
    color(225, 198, 192), 
    color(224, 140, 122)
  };

  float r;

  noiseSeed((long)random(9999));
  stroke(cs[(int)random(cs.length)]);
  noFill();

  for ( float d = 0; d < md; d += 3 ) {
    beginShape();
    for ( float t = 0; t < TWO_PI; t += PI/512 ) {
      r = d * (noise((cx+d/2*cos(t))/100, (cy+d/2*sin(t))/100) + 0.2);
      vertex(cx+r*cos(t), cy+r*sin(t));
    }
    endShape(CLOSE);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("261.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
