final boolean DEBUG_MODE = true;

Camera camera;
FractalTree fractalTree;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);

  if (DEBUG_MODE) camera = new Camera(width/2, height - 20);
  else camera = new Camera(width/2, height/2);
  camera.setBackgroundColor(0, 50, 100);

  fractalTree = new FractalTree(8);

  stroke(0, 0, 100);
  strokeWeight(4);
  strokeCap(ROUND);
}

void draw() {
  background(camera.backgroundColor.x, camera.backgroundColor.y, camera.backgroundColor.z);

  if (DEBUG_MODE) drawDefault();
  else drawFocus();
}

void drawDefault() {
  translate(camera.position.x, camera.position.y);
  rotate(radians(camera.rotation));
  fractalTree.draw();
}

void drawFocus() {
  translate(camera.position.x - TravellingEffect.focusPoint.x * TravellingEffect.zoom, camera.position.y - TravellingEffect.focusPoint.y * TravellingEffect.zoom);
  rotate(radians(camera.rotation));
  fractalTree.draw();
  point(TravellingEffect.focusPoint.x * TravellingEffect.zoom, TravellingEffect.focusPoint.y * TravellingEffect.zoom);
}

void mouseMoved(MouseEvent e) {
  if (DEBUG_MODE) return;
  TravellingEffect.zoom = lerp(0.8, 50, e.getX()/float(width));
}

void keyPressed(KeyEvent e) {
  if (e.getKey() == 'r') {
    fractalTree.generate();
  }
}
