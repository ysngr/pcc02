/* 259_20201226 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 280; i++ ) {
    walkingPolygon(random(width), random(height), random(10, 100));
  }
}


void walkingPolygon(float sx, float sy, float r) {

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
  final float D = 4;

  int wn = (int)random(600, 800);
  int pn = (int)random(3, 18);
  float nr;

  if ( random(100) < 1 ) {
    noiseSeed((long)random(9999));
  }
  stroke(cs[(int)random(cs.length)], 20);
  noFill();

  for ( int i = 0; i < wn; i++ ) {
    beginShape();
    for ( float t = 0; t < TWO_PI; t += TWO_PI/pn ) {
      nr = r * (noise(10*(sx+r*cos(t))/width, 10*(sy+r*sin(t))/height) + 0.2);
      vertex(sx+nr*cos(t), sy+nr*sin(t));
    }
    endShape(CLOSE);
    sx += D * (noise(10*sx/width) - 0.5);
    sy += D * (noise(10*sy/height) - 0.5);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("259.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
