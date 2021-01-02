/* 260_20210102 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 50; i++ ) {
    nwcircles(random(width), random(height), random(5, 20));
  }
}


void nwcircles(float sx, float sy, float sd) {

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
  final float dr = 2;
  final float dt = PI / 1024;
  final float dd = 2;

  int n = (int)random(500, 1000);
  float r = sd / 2;
  float t = random(-PI, PI);
  float d = 0;
  float ax, ay;
  float st = 1;

  if ( random(80) < 1 ) {
    noiseSeed((long)random(9999));
  }
  stroke(cs[(int)random(cs.length)], 60);
  noFill();

  for ( int i = 0; i < n; i++ ) {
    ax = (sx + r*cos(t)) / width;
    ay = (sy + r*sin(t)) / height;
    if ( random(50) < 1 ) {
      st *= -1;
    }
    r += dr * noise(ax, ay);
    t += st * dt;
    d += dd * (noise(ax, ay) - 0.5);
    circle(sx+r*cos(t), sy+r*sin(t), sd+d);
  }

  return ;
}




void keyPressed() {
  if ( key == 's' ) {
    saveFrame("260.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
