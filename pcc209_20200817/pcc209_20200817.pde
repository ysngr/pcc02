/* 209_20200817 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);

  final int p = 3, q = 2;
  final float r = 280, s = 80;
  final float dw = 400, dh = 100;
  final color[] cs = {
    color(232,  44, 110), 
    color( 82, 199, 227), 
    color( 71, 149,  83), 
    color(213, 232, 129)
  };

  float x, y;

  strokeWeight(1);
  noFill();

  for ( color c : cs ) {
    pushMatrix();
    translate(width/2+random(-1, 1)*dw, height/2+random(-1, 1)*dh);
    rotate(random(-PI, PI));
    for ( float t = 0; t < TWO_PI; t += PI/2048 ) {
      x = (r + s*cos(p*t)) * cos(q*t);
      y = (r + s*cos(p*t)) * sin(q*t);
      stroke(c, (t < PI)? map(t, 0, PI, 20, 180) : map(t, PI, TWO_PI, 180, 20));
      circle(x, y, map(noise(x/200, y/200), 0, 1, 4, 160));
    }
    popMatrix();
  }

  stroke(240);
  fill(242, 58, 7);
  for ( int i = 0; i < 8; i++ ) {
    strokeWeight(random(6, 10));
    circle(random(width), random(height), random(40, 180));
  }

  for ( float h = 0; h < height; h += 10 ) {
    strokeWeight(4*noise(h/height));
    stroke(240, random(20, 200));
    line(0, h, width, h);
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("209.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
