
Camera camera;
FractalTree fractalTree;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  
  camera = new Camera(width/2, height-25);
  camera.setBackgroundColor(0, 50, 100);
  
  fractalTree = new FractalTree(5);
  
  stroke(0, 0, 100);
  strokeWeight(4);
  strokeCap(ROUND);
}

void draw() {
  background(camera.backgroundColor.x, camera.backgroundColor.y, camera.backgroundColor.z);
  translate(camera.position.x, camera.position.y);
  rotate(radians(camera.rotation));
  fractalTree.draw();
  Branch branch = new Branch(0, 0);
  branch.draw();
}
