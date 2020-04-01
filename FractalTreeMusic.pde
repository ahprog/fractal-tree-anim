final boolean DEBUG_MODE = false;

Camera camera;
FractalTree fractalTree;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);

  if (DEBUG_MODE) camera = new Camera(width/2, height - 20);
  else camera = new Camera(width/2, height/2);
  camera.setBackgroundColor(0, 50, 100);

  fractalTree = new FractalTree(15);

  stroke(0, 0, 100);
  strokeWeight(4);
  strokeCap(ROUND);
}

void draw() {
  background(camera.backgroundColor.x, camera.backgroundColor.y, camera.backgroundColor.z);

  if (DEBUG_MODE) drawDefault();
  else drawFocus();
  
  TravellingEffect.zoom *= 1.01;
  camera.rotation += 0.1;
}

void drawDefault() {
  pushMatrix();
  translate(camera.position.x, camera.position.y);
  rotate(radians(camera.rotation));
  fractalTree.draw();
  popMatrix();
}

void drawFocus() {
  pushMatrix();
  
  translate(camera.position.x, camera.position.y);
  rotate(radians(camera.rotation));
  translate(-TravellingEffect.focusPoint.x * TravellingEffect.zoom, -TravellingEffect.focusPoint.y * TravellingEffect.zoom);

  fractalTree.draw();
  point(TravellingEffect.focusPoint.x * TravellingEffect.zoom, TravellingEffect.focusPoint.y * TravellingEffect.zoom);
  popMatrix();
}

void mouseMoved(MouseEvent e) {
  if (DEBUG_MODE) return;
  TravellingEffect.zoom = lerp(1, 10, e.getX()/float(width));
}

void keyPressed(KeyEvent e) {
  if (e.getKey() == 'r') {
    TravellingEffect.zoom = 1;
    fractalTree.generate();
  }
}
