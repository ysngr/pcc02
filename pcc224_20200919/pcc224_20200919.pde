/* 224_20200919 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(52, 5, 40);
  pushMatrix();
  translate(width/2, height/2);
  for ( int i = 0; i < 16; i++ ) {
    rotate(random(-PI, PI));
    aurora();
  }
  popMatrix();
  rcircles();
}


void aurora() {

  float sw, ew, dw, h, dh;

  sw = -random(1) * width;
  ew = random(1) * width;
  dw = 0;
  h = 0.45 * random(-1, 1) * height;
  dh = random(80, 240);

  noiseSeed((long)random(9999));
  strokeWeight(random(1, 2));

  for ( float w = sw; w < ew; w++ ) {
    aline(w, h, w+dw, h-dh);
    h += noise(h/100) - 1;
    dw += noise(w/width) - 1;
    dh += noise(h/height) - 1;
  }

  return ;
}


void aline(float sx, float sy, float ex, float ey) {

  float w, h, dw, dh;

  dw = (ex - sx) / 120;
  dh = (ey - sy) / 120;

  for ( w = sx, h = sy; dist(w, h, ex, ey) > 2; w += dw, h += dh ) {
    stroke(
      255 * noise(w/100), 
      255 * noise(h/100), 
      255 * noise(w, h)
    );
    point(w, h);
  }

  return ;
}


void rcircles() {

  noStroke();
  fill(245, 43, 2, 220);
  for ( int i = 0; i < 8; i++ ) {
    circle(random(width), random(height), random(40, 80));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("224.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
