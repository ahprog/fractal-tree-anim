class Branch {
  final static float DEFAULT_SIZE = 100;
  
  public PVector position;
  public float size;
  public float rotation; // en radians
  
  public Branch(PVector position, float rotation, float size) {
    this.position = position;
    this.size = size;
    this.rotation = rotation;
  }
  
  public Branch(PVector position) {
    this(position, 0, DEFAULT_SIZE);
  }
  
  public Branch(float x, float y) {
    this(new PVector(x, y));
  }
  
  public void draw() {
    pushMatrix();
    rotate(rotation);
    line(position.x, position.y, position.x, position.y - size);
    popMatrix();
  }
}
