class Branch {
  final static float DEFAULT_SIZE = 100;
  public float size;
  public float rotation; // en degrés
  
  public Branch parent;
  public LinkedList<Branch> childs;
  
  public Branch(float rotation, float size) {
    this.size = size;
    this.rotation = rotation;
    this.parent = null;
    this.childs = new LinkedList<Branch>();
  }
  
  public Branch() {
    this(0, DEFAULT_SIZE);
  }
  
  public void addChild(Branch child) {
    childs.add(child);
    child.parent = this;
  }
  
  public void draw() {
    pushMatrix();
    rotate(radians(rotation));
    line(0, 0, 0, -size);
    translate(0, -size);
    for(Branch branch : childs) {
      branch.draw(); 
    }
    popMatrix();
  }
}
