/* 230_20201003 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  cbackground(50, 58, 88);
  orbit();
  mountain();
}


void cbackground(int r, int g, int b) {

  final float D = calcMinColD(r, g, b);
  float dr, dg, db, divrw, divrh, divgw, divgh, divbw, divbh;

  divrw = random(width/4 , width );
  divrh = random(height/4, height);
  divgw = random(width/4 , width );
  divgh = random(height/4, height);
  divbw = random(width/4 , width );
  divbh = random(height/4, height);

  loadPixels();
  for ( int h = 0; h < height; h++ ) {
    for ( int w = 0; w < width; w++ ) {
      dr = D * (noise(w/divrw, h/divrh, r) - 0.5);
      dg = D * (noise(w/divgw, h/divgh, g) - 0.5);
      db = D * (noise(w/divbw, h/divbh, b) - 0.5);
      pixels[w+h*width] = color(r+dr, g+dg, b+db);
    }
  }
  updatePixels();

  return ;
}


float calcMinColD(float r, float g, float b) {

  float minv = min(r, g, b);
  float maxv = max(r, g, b);

  return min(minv, 255-maxv);
}


void initStroke() {

  final color[] cs = {
    color(227, 232, 173),
    color(229, 255, 254),
    color(68 , 105, 118)
  };

  if ( random(10) < 2 ) {
    blendMode(ADD);
  } else {
    blendMode(BLEND);
  }

  strokeWeight(random(1.2, 4.2));
  stroke(cs[(int)random(cs.length)], random(10, 80));

  return ;
}


void orbit() {

  final float or = dist(width/4, height/2, width, height);
  final float dt = PI / 2048;

  float st;

  pushMatrix();
  translate(width/4, height/2);

  for ( float r = 0; r < or; r += random(5, 15) ) {
    initStroke();
    st = random(-PI, PI);
    for ( float t = st; t < st+TWO_PI; t += dt ) {
      if ( random(100) < 1 ) {
        t += random(PI/6);
        initStroke();
      }
      point(r*cos(t), r*sin(t));
    }
  }

  popMatrix();

  return ;
}


void mountain() {

  strokeWeight(1);
  stroke(5, 8, 21);

  float h = height - 180;
  for ( float w = 0; w < width; w++ ) {
    line(w, h+map(noise(5*w/width), 0, 1, -100, 100), w, height);
    h -= random(0.5);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("230.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
