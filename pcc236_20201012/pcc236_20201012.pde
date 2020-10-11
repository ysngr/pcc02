/* 236_20201012 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(50);

  blendMode(HARD_LIGHT);
  for ( int i = 0; i < 5; i++ ) {
    hole(random(width), random(height), random(720, 1000));
  }
  for ( int i = 0; i < 36; i++ ) {
    ripple(random(0.05, 0.75)*width, random(0.1, 0.9)*height, random(40, 180));
  }

  blendMode(ADD);
  for ( int i = 0; i < 8; i++ ) {
    hole(random(0.6, 1.0)*width, random(0.5, 1.0)*height, random(180, 240));
  }

  blendMode(SUBTRACT);
  slash();
}


void ripple(float x, float y, float d) {

  final color[] cs = {
    color(245,  40, 118), 
    color(234,  85,  75), 
    color( 82, 177, 187), 
    color(251, 203, 103), 
    color(175,  98, 154), 
    color(192, 184,  95), 
    color(159, 192, 141), 
    color(179, 120,  85), 
    color(150, 205, 196)
  };

  int n = (int)random(4, 16);
  float sw = random(3.2, 4.4);

  stroke(cs[(int)random(cs.length)], random(180, 240));
  noFill();

  for ( int i = 0; i < n; i++ ) {
    strokeWeight(sw);
    circle(x, y, (1+0.05*i)*d);
    if ( (sw -= 0.4 ) < 0 ) {
      break;
    }
  }

  return ;
}


void hole(float x, float y, float d) {

  final color[] cs = {
    color(226,  69,  31), 
    color(231, 117,  52), 
    color(244, 164,  88)
  };

  float r = d / 2;
  color c = cs[(int)random(cs.length)];

  strokeWeight(1);
  noFill();

  for ( float a = 80; a > 0; a -= random(0.75) ) {
    stroke(c, a);
    circle(x, y, 2*r);
    r++;
  }

  return ;
}


void slash() {

  stroke(50, 40);
  for ( float w = 0; w < 2*width; w += random(5, 20) ) {
    strokeWeight(8*noise(w/200));
    line(w, 0, 0, w);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("236.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
