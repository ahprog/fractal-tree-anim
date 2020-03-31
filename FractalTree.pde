//Graphismes
PVector backgroundColor = new PVector(130, 130, 130);

void setup() {
  size(600,600);
}

void draw() {
  background(backgroundColor.x, backgroundColor.y, backgroundColor.z);
  stroke(255);
  strokeWeight(4);
  strokeCap(ROUND);
  line(20, 30, 80, 30);
}
