/* 241_20201026 */

final color BGC = color(240);
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


void setup() {
  size(1150, 800);
  noLoop();
  textAlign(CENTER, CENTER);
  textFont(createFont("Consolas", 16));
  rectMode(CENTER);
}


void draw() {
  background(BGC);
  initLines();
  initTexts();
  getWalk();
  dsquares();
  decholes();
}


void initLines() {

  final float D = 200;
  final float R = mag(width/2, height/2) + D;

  float t, dx, dy;

  strokeWeight(1);

  pushMatrix();
  translate(width/2, height/2);

  for ( int i = 0; i < 20; i++ ) {
    stroke(cs[(int)random(cs.length)]);
    t = random(-PI, PI);
    dx = D * random(-1, 1);
    dy = D * random(-1, 1);
    line(R*cos(t)+dx, R*sin(t)+dy, R*cos(t+PI)+dx, R*sin(t+PI)+dy);
  }

  popMatrix();

  return ;
}


void initTexts() {

  final String s = "createcoding";

  for ( int i = 0; i < s.length(); i++ ) {
    for ( int j = 0; j < 10; j++ ) {
      fill(cs[(int)random(cs.length)]);
      textSize(random(32, 128));
      text(s.charAt(j), random(width), random(height));
    }
  }

  return ;
}


void getWalk() {

  int x, y, dx, dy;

  strokeWeight(1.2);

  for ( int i = 0; i < 200; i++ ) {
    x = (int)random(width);
    y = (int)random(height);
    dx = getD();
    dy = getD();
    stroke(cs[(int)random(cs.length)]);
    for ( int j = 0; j < 800; j++ ) {
      point(x, y);
      x += dx;
      y += dy;
      if ( get(x, y) != BGC ) {
        dx = getD();
        dy = getD();
      }
    }
  }

  return ;
}


int getD() {
  return ( random(2) < 1 )? 1 : -1;
}


void dsquares() {

  blendMode(DIFFERENCE);
  strokeWeight(1);
  noFill();

  for ( int i = 0; i < 20; i++ ) {
    stroke(cs[(int)random(cs.length)]);
    square(random(width), random(height), random(80, 680));
  }

  blendMode(BLEND);

  return ;
}


void decholes() {

  float x, y, r;
  int idx;

  strokeWeight(1);
  noFill();

  for ( int i = 0; i < 6; i++ ) {
    x = random(width); 
    y = random(height);
    r = 700;
    idx = (int)random(cs.length);
    for ( float a = 50; a > 0; a -= random(1) ) {
      stroke(cs[idx], a);
      circle(x, y, 2*r);
      r++;
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("241.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
