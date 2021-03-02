/* 270_20210302 */

final color[] cs = {
  color(235, 230, 237), 
  color(213, 206, 220), 
  color(178, 177, 187), 
  color(243, 174, 204), 
  color(200, 139, 169), 
  color(231, 214, 222), 
  color(114, 126, 154), 
  color(118, 102, 141), 
  color(185, 157, 185)
};


void setup() {
  size(1150, 800);
  noLoop();
  strokeCap(PROJECT);
  rectMode(CENTER);
}


void draw() {
  background(240);
  for ( int i = 0; i < 60; i++ ) {
    lsquare(random(width), random(height), random(20, 180));
    if ( random(4) < 1 ) {
      rsquare(random(width), random(height), random(20, 120));
    } else {
      esquare(random(width), random(height), random(20, 240));
    }
    if ( random(10) < 1 ) {
      osquare(random(width), random(height), random(600, 1000));
    }
  }
}


void esquare(float x, float y, float l) {

  strokeWeight(random(8));
  stroke(cs[(int)random(cs.length)]);
  fill(cs[(int)random(cs.length)]);
  square(x, y, l);

  return ;
}


void lsquare(float x, float y, float l) {

  float sw = random(6);

  setStrokeColor(sw);
  for ( float w = x-l/2; w < x; w += 2*sw ) {
    line(w, y-l/2, w, y);
  }
  setStrokeColor(sw);
  for ( float w = x; w < x+l/2; w += 2*sw ) {
    line(w, y, w, y+l/2);
  }
  setStrokeColor(sw);
  for ( float h = y-l/2; h < y; h += 2*sw ) {
    line(x, h, x+l/2, h);
  }
  setStrokeColor(sw);
  for ( float h = y; h < y+l/2; h += 2*sw ) {
    line(x-l/2, h, x, h);
  }

  return ;
}


void rsquare(float x, float y, float l) {

  blendMode(DIFFERENCE);
  esquare(x, y, l);
  blendMode(BLEND);

  return ;
}


void osquare(float x, float y, float l) {

  strokeWeight(random(8, 24));
  stroke(cs[(int)random(cs.length)]);
  noFill();
  square(x, y, l);

  return ;
}


void setStrokeColor(float sw) {

  strokeWeight(sw);
  stroke(cs[(int)random(cs.length)]);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("270.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
