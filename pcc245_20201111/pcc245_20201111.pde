/* 245_20201111 */

final color[] cs = {
  color(173, 128, 175), 
  color(246, 237,  67), 
  color(244, 159,  58), 
  color( 78, 191, 213), 
  color(232,  68, 126), 
  color(182, 212,  88), 
  color(250, 250, 245), 
  color( 83, 250, 245)
};


void setup() {
  size(1150, 800);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(3, 20, 43);
  ripple();
  for ( int i = 0; i < 18; i++ ) {
    wave();
  }
  fdots();
}


void wave() {

  final float a = 200;
  final float H = 200;

  PGraphics pg = createGraphics(1150, 800);
  color c = cs[(int)random(cs.length)];

  strokeWeight(1.2);
  noiseSeed((long)random(9999));

  pg.beginDraw();
  for ( float h = 0; h < H; h+=2.5 ) {
    for ( float w = 0; w < width; w++ ) {
      pg.set((int)w, (int)(h+a*noise(10*w/width, 10*h/height)), color(c, 220));
    }
  }
  pg.endDraw();

  pushMatrix();
  translate(random(0.4, 0.6)*width, random(0.4, 0.6)*height);
  rotate(random(-PI, PI));
  image(pg, -width/2, -H/2);
  popMatrix();

  return ;
}


void ripple() {

  pushMatrix();
  translate(width/2, height/2);
  rotate(random(-PI, PI));

  noFill();

  for ( float d = 0; d < mag(width, height); d += random(5, 10) ) {
    strokeWeight(random(1));
    stroke(cs[(int)random(cs.length)]);
    circle(random(0.3)*d, random(0.3)*d, d);
  }

  popMatrix();

  return ;
}


void fdots() {

  noStroke();
  fill(240, 29, 57);

  for ( int i = 0; i < 40; i++ ) {
    circle(random(width), random(height), random(20, 40));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("245.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
