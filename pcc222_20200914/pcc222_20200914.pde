/* 222_20200914 */

void setup() {
  size(1150, 800);
  noLoop();
  textFont(createFont("HGS教科書体", 20));
}


void draw() {
  background(40, 13, 82);

  final String w = "めぐり逢ひて見しやそれともわかぬ間に雲隠れにし夜半の月かな";
  for ( int i = 0; i < w.length(); i++ ) {
    for ( int j = 0; j < 4; j++ ) {
      flowChar(w.charAt(i));
    }
  }
  for ( int i = 0; i < 18; i++ ) {
    fcircle(random(width), random(height), random(40, 80));
  }
  for ( int i = 0; i < 3; i++ ) {
    diffMoon(random(width), random(height), random(240, 620));
  }
}


void flowChar(char c) {

  final color[] cs = {
    color(243, 228, 219), 
    color(223, 205, 195), 
    color(147,  85, 108), 
    color(254, 249, 238), 
    color(244, 239, 229), 
    color(231, 212, 228), 
    color(167, 117, 165), 
    color(132,  81, 129), 
    color(105,  57,  76)
  };

  noStroke();
  fill(cs[(int)random(cs.length)]);
  textSize(random(20, 180));
  text(c, random(width), random(height));

  return ;
}


void fcircle(float x, float y, float d) {

  noStroke();
  fill(227, 23, 26, random(128, 240));
  circle(x, y, d);

  return ;
}


void diffMoon(float x, float y, float d) {

  blendMode(DIFFERENCE);
  noStroke();
  fill(210, 190, 220);
  circle(x, y, d);
  blendMode(BLEND);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("222.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
