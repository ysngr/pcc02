/* 215_20200904 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(112, 123, 153);
  backwave();
  bdots();
  forwardwave();
  holes();
  dots();
}


void backwave() {

  final float dh = 2.8, r = 70;

  float y;

  blendMode(SCREEN);
  strokeWeight(1.8);
  stroke(121, 174, 208, 180);

  loadPixels();
  for ( float h = -r; h < height+dh; h += dh ) {
    for ( float w = 0; w < width; w++ ) {
      y = (int)(h + r*noise(w/100, h/100));
      if ( 0 <= y && y < height ) {
        pixels[(int)(w+y*width)] = color(121, 174, 208, 110);
      }
    }
  }
  updatePixels();

  return ;
}


void bdots() {

  final color[] cs = {
    color( 82, 177, 187), 
    color(150, 205, 196), 
    color(159, 184,  95)
  };

  blendMode(BLEND);

  noStroke();
  for ( color c : cs ) {
    fill(c, 160);
    circle(random(width), random(height), random(600, 800));
  }

  return ;
}


void forwardwave() {

  final float D = 80;
  final color[] cs = {
    color(220,  79,  18), 
    color(229, 129,  34), 
    color(240, 180,  70), 
    color(232,  56,  57), 
    color(232,  56,  40)
  };

  blendMode(BLEND);

  pushMatrix();
  translate(width/2, height/2);

  for ( int i = 0; i < 16; i++ ) {
    strokeWeight(random(1, 5));
    stroke(cs[(int)random(cs.length)], 120);
    translate(D*random(-1, 1), D*random(-1, 1));
    rotate(random(-PI, PI));
    for ( float w = -width; w < 2*width; w++ ) {
      point(w, D*noise(w/100));
    }
  }

  popMatrix();

  return ;
}


void holes() {

  final color[] cs = {
    color( 74, 172, 188), 
    color( 48, 128, 152), 
    color( 37,  92, 142)
  };

  float x, y, r, a;

  blendMode(ADD);

  for ( color c : cs ) {
    x = random(width);
    y = random(height);
    r = random(240, 380);
    a = random(20, 40);
    noFill();
    while ( a > 0 ) {
      stroke(c, a);
      circle(x, y, r);
      a -= random(0.4);
      r++;
    }
  }

  return ;
}


void dots() {

  final color[] cs = {
    color(217, 117,  86), 
    color(226,  69,  68), 
    color(206,  49,   8), 
    color(232,  56,  40)
  };

  blendMode(BLEND);
  noStroke();
  for ( int i = 0; i < 20; i++ ) {
    fill(cs[(int)random(cs.length)]);
    circle(random(width), random(height), random(40, 120));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("215.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
