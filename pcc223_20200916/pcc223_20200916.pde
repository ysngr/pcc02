/* 223_20200916 */

void setup() {
  size(1150, 800);
  noLoop();
  noiseSeed(1630);
}


void draw() {
  background(237, 242, 240);
  for ( int i = 0; i < 25; i++ ) {
    barea();
  }
}


void barea() {

  final float A = 2, D = 80, DX = 80, DY = 40;
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

  float px, py, qx, qy, dx, dy;

  px = width - D;
  py = D;
  qx = D;
  qy = height - D;

  dx = DX * random(-1, 1);
  dy = DY * random(-1, 1);
  translate(width/2+dx, height/2+dy);
  rotate(random(-PI, PI));
  translate(-width/2-dx, -height/2-dy);

  stroke(cs[(int)random(cs.length)], 50);
  noFill();

  for ( int i = 0; i < 200; i++ ) {
    bezier(
      D      , D       , 
      px     , py      , 
      qx     , qy      , 
      width-D, height-D
    );
    if ( random(3) < 1 ) { 
      px += A * random(-1, 1);
      py += A * random(-1, 1);
      qx += A * random(-1, 1);
      qy += A * random(-1, 1);
    } else {
      px += A * (noise(px/width)-1);
      py -= A * (noise(py/height)-1);
      qx += A * (noise(qx/width)-1);
      qy -= A * (noise(qy/height)-1);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("223.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
