
Camera camera;
FractalTree fractalTree;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);

  camera = new Camera(width/2, height/2);
  camera.setBackgroundColor(0, 50, 100);

  fractalTree = new FractalTree(6);

  stroke(0, 0, 100);
  strokeWeight(4);
  strokeCap(ROUND);
}

void draw() {
  background(camera.backgroundColor.x, camera.backgroundColor.y, camera.backgroundColor.z);

  translate(camera.position.x - TravellingEffect.focusPoint.x * TravellingEffect.zoom, camera.position.y - TravellingEffect.focusPoint.y * TravellingEffect.zoom);
  rotate(radians(camera.rotation));
  fractalTree.draw();
  
  point(TravellingEffect.focusPoint.x * TravellingEffect.zoom, TravellingEffect.focusPoint.y * TravellingEffect.zoom);

  println(TravellingEffect.focusPoint);
}

void mouseMoved(MouseEvent e) {
  TravellingEffect.zoom = lerp(0.8, 50, e.getX()/float(width));
}
