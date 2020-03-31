class Branch {
  final static float DEFAULT_SIZE = 100;
  
  public PVector position;
  public float size;
  public float rotation; // en degrés
  
  public Branch parent;
  public LinkedList<Branch> childs;
  
  public Branch(PVector position, float rotation, float size) {
    this.position = position;
    this.size = size;
    this.rotation = rotation;
    this.parent = null;
    this.childs = new LinkedList<Branch>();
  }
  
  public Branch(PVector position) {
    this(position, 0, DEFAULT_SIZE);
  }
  
  public Branch(float x, float y) {
    this(new PVector(x, y));
  }
  
  public Branch() {
    this(0, 0);
  }
  
  public void draw() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(radians(rotation));
    line(0, 0, 0, -size);
    
    for(Branch branch : childs) {
      branch.draw(); 
    }
    popMatrix();
  }
}
