/* 290_20210320 */

void setup() {
  size(1150, 800);
  noLoop();
  textAlign(CENTER, CENTER);
  textFont(createFont("HGS教科書体", 16));
}


void draw() {
  background(240);
  for ( int i = 0; i < 32; i++ ) {
    ss(random(width), random(height), random(120, 400), random(120, 400));
  }
}


void ss(float sx, float sy, float wh, float ht) {

  final String s = "整列した文字列";

  int idx;
  float d;
  boolean isIndent;

  idx = 0;
  d = ( random(10) < 1 )? random(80, 120) : random(10, 50);
  isIndent = true;

  pushMatrix();
  translate(sx, sy);
  rotate((int)random(4)*HALF_PI);
  textSize(d);
  noStroke();
  if ( random(10) < 1 ) {
    fill(240, 28, 17);
  } else {
    fill(random(200), 200);
  }

  for ( float h = 0; h < wh; h += d ) {
    for ( float w = 0; w < ht; w += d ) {
      if ( isIndent ) {
        isIndent = false;
        continue;
      }
      if ( w != 0 && random(100) < 1 ) {
        isIndent = true;
        break;
      }
      text(s.charAt((idx++)%s.length()), w, h);
    }
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("290.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
