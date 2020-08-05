/* 203_20200805 */

PVector[] ps;

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  backaurora();
  holes();
  initPoints();
  for ( PVector p : ps ) {
    planet(p.x, p.y, p.z);
  }
}


void backaurora() {

  loadPixels();
  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      pixels[(int)(w+h*width)] = color(
        map(noise(w/200, h/120), 0, 1,  30,  80), 
        map(noise(w/300, h/150), 0, 1, 120, 180), 
        map(noise(w/140, h/200), 0, 1, 160, 220)
      );
    }
  }
  updatePixels();

  return ;
}


void holes() {

  final color[] cs = {
    color(226,  69,  31), 
    color(231, 117,  52), 
    color(244, 164,  88)
  };

  float x, y, r;

  strokeWeight(1);
  noFill();

  for ( color c : cs ) {
    x = random(width);
    y = random(height);
    r = random(200, 240);
    for ( float a = 140; a > 0; a -= random(1) ) {
      stroke(c, a);
      circle(x, y, 2*r);
      r += 1;
    }
  }

  return ;
}


void initPoints() {

  boolean isGoto;
  float x, y, d, md;

  ps = new PVector[30];
  for ( int i = 0; i < ps.length; i++ ) {
    md = 9999;
    x = random(width);
    y = random(height);
    isGoto = false;
    for ( int j = 0; j < i; j++ ) {
      if ( dist(x, y, ps[j].x, ps[j].y) < 0.8*ps[j].z ) {
        i--;
        isGoto = true;
        break;
      }
    }
    if ( isGoto ) {
      continue;
    }
    for ( int j = 0; j < i; j++ ) {
      if ( (d = dist(x, y, ps[j].x, ps[j].y)/2) < md ) {
        md = d;
      }
    }
    ps[i] = new PVector(x, y, min(md, 260));
  }

  return ;
}


void planet(float cx, float cy, float d) {

  final color[] cs = {
    color(245,  40, 118), 
    color(234,  85,  75), 
    color( 82, 177, 187), 
    color(251, 203, 103), 
    color(175,  98, 154), 
    color(192, 184,  95), 
    color(159, 192, 141), 
    color(179, 120,  85), 
    color(150, 205, 196)
  };
  final float dt = PI / 512;

  int n = (int)random(1, 4.5);
  int[] idx = getIndexes(cs.length, 1+2*n);
  int idxi = 0;
  float sw, a, b, x, y;

  if ( random(20) < 1 ) {
    strokeWeight(2);
    stroke(cs[idx[idxi++]]);
    noFill();
  } else {
    noStroke();
    fill(cs[idx[idxi++]]);
  }
  circle(cx, cy, d);

  sw = map(d, 0, 240, 0.2, 3.6);
  for ( int i = 0; i < n; i++ ) {
    strokeWeight(sw+random(-0.2, 0.2));
    stroke(cs[idx[idxi++]]);
    fill(cs[idx[idxi++]]);
    pushMatrix();
    translate(cx, cy);
    rotate(random(-PI/4, PI/4));
    a = random(0.5, 0.9) * d;
    b = random(0.1, 0.4) * d;
    for ( float t = 0; t < TWO_PI; t += dt ) {
      x = a * cos(t);
      y = b * sin(t);
      if ( mag(x, y) > d/2 || t < PI ) {
        point(x, y);
        if ( random(500) < 1 ) {
          noStroke();
          circle(x, y, random(0.025, 0.08)*d);
          stroke(cs[idx[idxi-2]]);
        }
      }
    }
    popMatrix();
  }

  return ;
}


int[] getIndexes(int len, int n) {

  int[] indexes = new int[n];
  boolean isReassign;

  for ( int i = 0; i < indexes.length; i++ ) {
    do {
      indexes[i] = (int)random(len);
      isReassign = false;
      for ( int j = 0; j < i; j++ ) {
        if ( indexes[i] == indexes[j] ) {
          isReassign = true;
        }
      }
    } while ( isReassign );
  }

  return indexes;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("203.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
