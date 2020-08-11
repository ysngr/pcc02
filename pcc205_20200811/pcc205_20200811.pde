/* 205_20200811 */

final color[] cs = {
  color(149, 155, 169), 
  color( 94, 101, 102), 
  color(211, 210, 191), 
  color( 36,  49,  70), 
  color( 62,  87, 112), 
  color(217, 117,  86), 
  color(241, 173,  95), 
  color(225, 198, 192), 
  color(224, 140, 122)
};


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  auroraback();

  float l;
  for ( int i = 0; i < 14; i++ ) {
    l = random(120, 240);
    decrect(random(width)-l/2, random(height)-l/2, l, l, true);
  }

  translate(width/2, height/2);
  rotate(PI/6);
  translate(-width/2, -height/2);

  final float dw = (float)width/15, dh = (float)height/10;
  for ( float h = 0; h < height; h += dh ) {
    for ( float w = 0; w < width; w += dw ) {
      rects(w, h, dw, dh);
    }
  }
}


void auroraback() {

  loadPixels();
  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      pixels[(int)(w+h*width)] = color(
        map(noise(w/200, h/600), 0, 1, 100, 200), 
        map(noise(w/500, h/20 ), 0, 1,  40, 120), 
        map(noise(w/400, h/200), 0, 1,  20, 220)
      );
    }
  }
  updatePixels();

  return ;
}


void rects(float x, float y, float w, float h) {

  boolean fs = ( random(2) < 1 )? true : false;

  switch( (int)random(4) ) {
    case 0 : fsrect(x, y, w, h, fs);  break;
    case 1 :
    case 2 : decrect(x, y, w, h, fs); break;
    case 3 : rrect(x, y, w, h);       break;
  }

  return ;
}


void fsrect(float x, float y, float w, float h, boolean isStroke) {

  float sw;

  if ( isStroke ) {
    sw = random(1, 6);
    strokeWeight(sw);
    stroke(cs[(int)random(cs.length)]);
  } else {
    sw = 0;
    noStroke();
  }

  fill(cs[(int)random(cs.length)]);
  rect(x+sw/2, y+sw/2, w-sw, h-sw);

  return ;
}


void decrect(float x, float y, float w, float h, boolean isStroke) {

  float d, a;
  float iw = w, ih = h;
  color c = cs[(int)random(cs.length)];

  blendMode(ADD);

  if ( isStroke ) {
    strokeWeight(1);
    noFill();
  } else {
    noStroke();
  }

  d = 0;
  a = random(50, 70);
  while ( w-d > iw/2 && h-d > ih/2 ) {
    if ( isStroke ) {
      stroke(c, a);
    } else {
      fill(c, 5);
    }
    rect(x+d, y+d, w-2*d, h-2*d);
    d += 0.5;
    a--;
  }

  blendMode(BLEND);

  return ;
}


void rrect(float x, float y, float w, float h) {

  final float dd = 5;

  strokeWeight(1);
  stroke(cs[(int)random(cs.length)]);

  if ( random(2) < 1 ) {
    for ( float d = 0; d < w; d += dd ) {
      line(x+d, y, x+w, y+d);
    }
  }
  if ( random(2) < 1 ) {
    for ( float d = 0; d < h; d += dd ) {
      line(x+w, y+d, x+w-d, y+h);
    }
  }
  if ( random(2) < 1 ) {
    for ( float d = 0; d < h; d += dd ) {
      line(x+w-d, y+h, x, y+h-d);
    }
  }
  if ( random(2) < 1 ) {
    for ( float d = 0; d < h; d += dd ) {
      line(x, y+h-d, x+d, y);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("205.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
