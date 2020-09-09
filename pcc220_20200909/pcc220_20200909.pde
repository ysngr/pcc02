/* 220_20200909 */

void setup() {
  size(1150, 800);
  noLoop();
  rectMode(CENTER);
}


void draw() {
  background(240);
  for ( float h = 0; h < 1.1*height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      randSquare(w, h);
    }
  }
}


void randSquare(float w, float h) {

  if ( random(2) < 1 ) {
    return ;
  }

  float l = 200 * noise(w/200, h/200);
  
  pushMatrix();
  translate(w, h);
  rotate(TWO_PI*noise(w/width, h/height));

  noStroke();
  fill(
    map(noise(w/100, h/100), 0, 1, 0, 255), 
    map(noise(w/200, h/200), 0, 1, 0, 255), 
    map(noise(w/300, h/300), 0, 1, 0, 255), 
    map(noise(w/400, h/400), 0, 1, 0, 255)
  );
  square(0, 0, l);
  
  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("220.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
