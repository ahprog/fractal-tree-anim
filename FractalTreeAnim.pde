/**
 * FractalTreeAnim dessine l'animation de la pousse d'un fractal tree
 * On peut moduler le zoom et la vitesse de l'animation avec la souris
 * Rendu de génération procédurale (P. CUBAUD)
 * Antonin HERRERO - 2020
 */
 
Camera camera;
FractalTree fractalTree;
float zoomSpeed = 1.0;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);

  camera = new Camera(width/2, height/2);
  camera.setBackgroundColor(0, 50, 100);

  fractalTree = new FractalTree(100, this);

  stroke(0, 0, 100);
  strokeWeight(4);
  strokeCap(ROUND);
}

void draw() {
  background(camera.backgroundColor.x, camera.backgroundColor.y, camera.backgroundColor.z);
  drawTree();
  TravellingEffect.zoom *= zoomSpeed;
  camera.rotation += (1 - zoomSpeed) * 5;
  drawHUD();
  camera.backgroundColor.x = (camera.backgroundColor.x + fractalTree.animSpeed) % 360;
}

void drawTree() {
  pushMatrix();
  translate(camera.position.x, camera.position.y);
  rotate(radians(camera.rotation));
  translate(-TravellingEffect.getFocusPoint().x * TravellingEffect.zoom, -TravellingEffect.getFocusPoint().y * TravellingEffect.zoom);
  fractalTree.draw();
  point(TravellingEffect.getFocusPoint().x * TravellingEffect.zoom, TravellingEffect.getFocusPoint().y * TravellingEffect.zoom);
  popMatrix();
}

void drawHUD() {
  textSize(24);
  text("x" + nf(zoomSpeed, 0, 3), 475, 35);
  text("x" + nf(fractalTree.animSpeedCoeff, 0, 2), 15, 550);
  stroke(0, 0, 100);
  textSize(15);
  text("Zoom", 50, 30);
  text("Speed", 7, 70);
  line(20, 20, 50, 50);
}

void mouseMoved(MouseEvent e) {
  zoomSpeed = lerp(0.98, 1.02, e.getX()/float(width));
  fractalTree.animSpeedCoeff = lerp(0.0, 0.3, e.getY()/float(height));
}

void keyPressed(KeyEvent e) {
  if (e.getKey() == 'r') {
    TravellingEffect.zoom = 1;
    fractalTree.generate();
  }
}

void reset() {
  TravellingEffect.zoom = 1;
  camera.rotation = 0;
  fractalTree.animSpeedCoeff = 0.1;
}
