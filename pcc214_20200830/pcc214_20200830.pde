/* 214_20200830 */

final color[] cs = {
  color( 41, 210, 227), 
  color(209,  78, 154), 
  color( 99, 144, 214), 
  color(232, 101,  19), 
  color(232, 218,  63), 
  color( 72, 224, 205), 
  color(114, 146, 240), 
  color( 66, 171, 234)
};


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(220, 230, 235);

  for ( int i = 0; i < 25; i++ ) {
    frect();
  }
  for ( int i = 0; i < 10; i++ ) {
    srect();
  }
  for ( int i = 0; i < 22; i++ ) {
    decarea(true);
  }
  for ( int i = 0; i < 18; i++ ) {
    decarea(false);
  }
  for ( int i = 0; i < 55; i++ ) {
    frect();
  }
}


void frect() {

  float dw, dh;

  dw = random(3, 7);
  dh = random(120, 180);

  noStroke();
  fill(cs[(int)random(cs.length)], random(60, 120));

  rrect(dw, dh);

  return ;
}


void srect() {

  float dw, dh;

  dw = random(80, 160);
  dh = random(80, 160);

  strokeWeight(random(2, 6));
  stroke(cs[(int)random(cs.length)], random(60, 120));
  noFill();

  rrect(dw, dh);

  return ;
}


void rrect(float dw, float dh) {

  pushMatrix();
  translate(random(width)-dw/2, random(height)-dh/2);
  rotate(random(-PI, PI));
  rect(0, 0, dw, dh);
  popMatrix();

  return ;
}


void decarea(boolean isBlue) {

  final color[] rcs = {
    color(229,  76,  97), 
    color(240,  69,  27), 
    color(245, 119,  27), 
    color(234, 102, 188)
  };
  final color[] bcs = {
    color( 35, 160, 216), 
    color( 96, 160, 222), 
    color( 75, 167, 240), 
    color(231, 240, 136), 
    color( 34, 190, 209), 
    color( 41, 224, 177), 
    color(220, 230, 235)
  };
  final float MS = 128;

  float aw, ah, sw, sh, d;
  color c;

  if ( isBlue ) {
    d = random(240, 420);
    c = bcs[(int)random(bcs.length)];
  } else {
    d = random(40, 100);
    c = rcs[(int)random(rcs.length)];
  }
  sw = random(width) - d/2;
  sh = random(height) - d/2;

  strokeWeight(isBlue? 0.8 : 1.0);
  for ( float h = sh; h < sh + d; h++ ) {
    ah = MS * sin(PI*(h-sh)/d);
    for ( float w = sw; w < sw + d; w++ ) {
      aw = MS * sin(PI*(w-sw)/d);
      stroke(c, aw+ah);
      point(w, h);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("214.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
