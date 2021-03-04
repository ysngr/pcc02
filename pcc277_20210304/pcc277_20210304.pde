/* 277_20210304 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 200; i++ ) {
    nboard(random(80, 280));
  }
}


void nboard(float l) {

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
  final float A = 140;

  PGraphics pg = createGraphics((int)l, (int)l);
  color c = cs[(int)random(cs.length)];

  strokeWeight(0.8);
  noiseSeed((long)random(9999));

  pg.beginDraw();
  for ( float h = 0; h < l; h += 1.2 ) {
    for ( float w = 0; w < width; w++ ) {
      pg.set((int)w, (int)(h+A*noise(10*w/width, 10*h/height)), color(c, 160));
    }
  }
  pg.endDraw();

  pushMatrix();
  translate(random(width), random(height));
  rotate(random(-PI, PI));
  image(pg, 0, 0);
  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("277.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
