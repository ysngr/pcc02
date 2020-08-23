/* 212_20200824 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(250, 250, 245);

  for ( int i = 0; i < 22; i++ ) {
    fline(random(height/4));
  }
  dots();
  slash();
}


void fline(float sh) {

  final color[] cs = {
    color(205, 223, 233), 
    color(159, 192, 207), 
    color(136, 160, 203), 
    color(254, 236, 204), 
    color(252, 227, 205), 
    color(117, 129, 179), 
    color(139, 163, 196), 
    color(217, 200, 223), 
    color(158, 200, 168), 
    color(246, 217, 230), 
    color(179, 127, 144)
  };

  float x, y, dy;
  color c = cs[(int)random(cs.length)];

  stroke(c);

  x = 0;
  y = sh;
  dy = -1;

  while ( x < width ) {
    strokeWeight(map(noise(x/40, y/40), 0, 1, 0.5, 25));
    point(x, y);
    if ( random(100) < 1 ) {
      strokeWeight(random(1, 4));
      line(x, y, x, y+random(1)*200);
    }
    x++;
    if ( random(50) < 1 || (y += dy) < 0 || height < y ) {
      dy *= -1;
    }
  }

  return ;
}


void dots() {

  noStroke();
  fill(206, 49, 8, 180);
  for ( int i = 0; i < 5; i++ ) {
    circle(random(width), random(height), random(60, 100));
  }

  return ;
}


void slash() {

  stroke(250, 250, 245, 120);
  for ( float w = 0; w < 2*width; w += random(20) ) {
    strokeWeight(map(noise(w/200), 0, 1, 0.5, 2));
    line(w, 0, 0, w);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("212.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
