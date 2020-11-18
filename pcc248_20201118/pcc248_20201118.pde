/* 248_20201118 */

final color BGC = color(253, 237, 223);


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(BGC);
  for ( int i = 0; i < 240; i++ ) {
    barcs(random(width), random(height), random(120, 240));
  }
  wave();
  for ( int i = 0; i < 4; i++ ) {
    barcs(width/2, height/2, 1500);
  }
  for ( int i = 0; i < 80; i++ ) {
    barcs(random(width), random(height), random(120, 240));
  }
  for ( int i = 0; i < 32; i++ ) {
    barcs(random(width), random(height), random(240, 360));
  }
}


void barcs(float x, float y, float d) {

  final color[] cs = {
    color(233,  84, 100), 
    color(244, 173, 163), 
    color(247, 185, 119), 
    color(198, 104, 150), 
    color(183,  40,  45), 
    color(201, 153,  98), 
    color(162, 215, 221), 
    color( 92, 173,  75), 
    color(253, 237, 223)
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
    stroke(( random(10) < 9 )? color(cs[idx]) : BGC);
    arc(0, 0, r, r, st, et);
    r += random(2.4, 3.6);
    st += random(-1, 1) * PI/16;
    et += random(-1, 1) * PI/16;
  }

  popMatrix();

  return ;
}


void wave() {

  final float a = 200;

  strokeWeight(0.7);

  for ( float h = -a; h < height+a; h += 1.2 ) {
    for ( float w = 0; w < width; w++ ) {
      set((int)w, (int)(h+a*noise(10*w/width, 10*h/height)), BGC);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("248.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
