/* 231_20201003 */

final color[] cs = {
  color(163, 214, 206), 
  color(100, 187, 186), 
  color( 63, 171, 155), 
  color(133, 203, 191), 
  color(165, 213, 183), 
  color( 89, 188, 157), 
  color(100, 157, 112), 
  color( 48, 128, 152), 
  color( 74, 172, 188), 
  color(234,  77,  21), 
  color(214,  85,  11)
};


void setup() {
  size(1150, 800);
  noLoop();
  blendMode(HARD_LIGHT);
  textFont(createFont("consolas", 16));
  textAlign(CENTER, CENTER);
}


void draw() {
  background(37, 92, 142);
  for ( int i = 0; i < 80; i++ ) {
    lines();
  }
  for ( int i = 0; i < 28; i++ ) {
    ripple(random(width), random(height), random(120, 280));
  }
}


void ripple(float cx, float cy, float d) {

  int n = (int)random(20, 40);

  noStroke();
  fill(cs[(int)random(cs.length)], 12);

  for ( int i = 0; i < n; i++ ) {
    circle(cx, cy, (1+0.05*i)*d);
  }

  return ;
}


void lines() {

  String[] ss = loadStrings("pcc231_20201003.pde");
  String s = ss[(int)random(ss.length)];

  pushMatrix();
  translate(random(width), random(height));
  rotate(random(-PI, PI)/12);
  textSize(random(16, 38));
  fill(cs[(int)random(cs.length)], 120);
  text(s, 0, 0);
  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("231.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
