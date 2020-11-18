/* 249_20201118 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);

  final float d = 160, g = 15;
  
  bcircle(width/2, height/2, 1500);
  for ( float h = 0; h <= height; h += d/2 ) {
    for ( float w = g; w <= width; w += d/2 ) {
      bcircle(w, h, d);
    }
  }
  for ( int i = 0; i < 12; i++ ) {
    bcircle(random(width), random(height), random(280, 580));
  }
}


void bcircle(float x, float y, float d) {

  for ( int i = 0; i < 6; i++ ) {
    barcs(x, y, d);
  }

  return ;
}


void barcs(float x, float y, float d) {

  final color[] cs = {
    color(227, 236, 244), 
    color(112, 148, 192), 
    color( 56,  90, 158), 
    color(234, 235, 235), 
    color(212, 212, 211), 
    color( 51,  49, 115), 
    color(232, 211, 207), 
    color(204, 104, 117), 
    color(164, 125,  90)
  }; 

  float r, st, et; 
  int idx; 

  pushMatrix(); 
  translate(x, y); 
  rotate(random(-PI, PI)); 

  r = 0; 
  st = 0; 
  et = random(PI/6, 3*PI/2); 
  idx = (int)random(cs.length); 

  strokeWeight(1.2); 
  noFill(); 

  while ( r < d/2 ) {
    stroke(( random(10) < 9 )? color(cs[idx]) : color(240)); 
    arc(0, 0, r, r, st, et); 
    r += random(2.4, 3.6); 
    st += random(-1, 1) * PI/16; 
    et += random(-1, 1) * PI/16;
  }

  popMatrix(); 

  return;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("249.png"); 
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
