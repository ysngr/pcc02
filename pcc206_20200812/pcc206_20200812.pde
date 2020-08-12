/* 206_20200812 */

PVector[] ps;

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  translate(width/2, height/2);
  rotate(PI/5);
  translate(-width/2, -height/2);
  back();
  initPoints();
  waves();
  points();
  translate(width/2, height/2);
  rotate(-PI/5);
  translate(-width/2, -height/2);
  circles();
}


void back() {

  loadPixels();
  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      pixels[(int)(w+h*width)] = color(
        map(noise(w/width), 0, 1, 0, 100), 
        map(noise(h/height), 0, 1, 80, 220), 
        map(noise(w/width, h/height), 0, 1, 120, 240)
      );
    }
  }
  updatePixels();

  return ;
}


void initPoints() {

  ps = new PVector[50];
  for ( int i = 0; i < ps.length; i++ ) {
    ps[i] = new PVector(random(width), random(height));
  }

  return ;
}


void waves() {

  blendMode(SCREEN);
  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = i+1; j < ps.length; j++ ) {
      if ( pvdist(ps[i], ps[j]) > 150 && random(10) < 1 ) {
        wave(ps[i], ps[j]);
      }
    }
  }

  return ;
}


float pvdist(PVector p, PVector q) {
  return dist(p.x, p.y, q.x, q.y);
}


void wave(PVector p, PVector q) {

  float t, dx, a;

  if ( q.x < p.x ) {
    PVector temp = p;
    p = q;
    q = temp;
  }

  dx = q.x - p.x;
  t = atan((q.y-p.y)/dx);
  a = map(dx, 0, width, 4, 0);

  pushMatrix();
  translate(p.x, p.y);
  rotate(t);

  strokeWeight(random(0.8, 2.5));
  for ( float x = 0; x < pvdist(p, q); x += 0.2 ) {
    stroke(
      map(noise((p.x+x*cos(t))/100), 0, 1, 0, 255), 
      map(x, 0, pvdist(p, q), 0, 80), 
      map(noise((p.y+x*sin(t))/100), 0, 1, 0, 255), 
      200
    );
    point(x, a*sin(x/PI));
  }

  popMatrix();

  return ;
}


void points() {

  blendMode(BLEND);
  noStroke();
  
  for ( PVector p : ps ) {
    fill(random(0, 120), random(0, 80), random(80, 180));
    circle(p.x, p.y, random(20, 40));
  }

  return ;
}


void circles() {

  blendMode(ADD);
  noStroke();
  
  for ( int i = 0; i < 10; i++ ) {
    fill(random(255), random(255), random(255), 200);
    circle(random(width), random(height), random(100, 260));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("206.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
