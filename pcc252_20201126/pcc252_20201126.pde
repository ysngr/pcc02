/* 252_20201126 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(200, 211, 221);
  ncircle(width/2, height/2, 800);
  for ( int i = 0; i < 8; i++ ) {
    ncircle(random(width), random(height), random(180, 320));
  }
  for ( int i = 0; i < 64; i++ ) {
    ncircle(random(width), random(height), random(60, 180));
  }
}


void ncircle(float x, float y, float diam) {

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

  float a, st, et;
  int n = (int)random(32, 64);

  noFill();

  for ( int i = 0; i < n; i++ ) {
    noiseSeed((long)random(9999));
    stroke(cs[(int)random(cs.length)], 60);
    a = random(20, 80);
    for ( float d = 0; d < diam; d++ ) {
      st = a * noise(d/diam);
      et = st + TWO_PI * (noise(d/diam) - 0.5);
      arc(x, y, d, d, st, et);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("252.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
