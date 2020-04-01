class Branch {
  final static float DEFAULT_SIZE = 100;
  public PVector worldPosition;
  public float worldRotation;
  public float size;
  public float maxSize;
  public float sizePercent;
  public float rotation; // en degrés
  
  public PVector hsb;
  
  public Branch parent;
  public LinkedList<Branch> childs;
  
  public Branch(float size, float rotation) {
    this.size = 0;
    this.rotation = rotation;
    this.parent = null;
    this.childs = new LinkedList<Branch>();
    this.worldPosition = new PVector(0, 0);
    this.hsb = new PVector(0, 0, 100);
    this.maxSize = size;
    this.sizePercent = 0.0;
  }
  
  public Branch() {
    this(DEFAULT_SIZE, 0);
  }
  
  public void setParent(Branch parent) {
    this.parent = parent;
    worldRotation = rotation + parent.worldRotation;
    worldPosition.x = parent.worldPosition.x + parent.size * cos(radians(parent.worldRotation + 270));
    worldPosition.y = parent.worldPosition.y + parent.size * sin(radians(parent.worldRotation + 270));
  }
  
  public void addChild(Branch child) {
    childs.add(child);
    child.setParent(this);
  }
  
  public void updateSize(float percent) {
    sizePercent += percent;
    size = maxSize * sizePercent;
  }
  
  public void draw() {
    //TODO : la world position ne devrait etre gardée que dans une seule branche special que suivrait le travelling effect
    pushMatrix();
    rotate(radians(rotation));
    stroke(hsb.x, hsb.y, hsb.z);
    line(0, 0, 0, -size * TravellingEffect.zoom);
    translate(0, -size * TravellingEffect.zoom);
    for(Branch branch : childs) {
      branch.draw();
    }
    popMatrix();
  }
  
  public void resetColor() {
    hsb = new PVector(0, 0, 100);
  }
}
