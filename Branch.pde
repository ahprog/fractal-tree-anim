
/**
 * Represente une branche de l'arbre fractal
 */
class Branch {
  final static float DEFAULT_SIZE = 100;
  //On garde en mémoire la position/rotation de la branche en coordonnées monde afin de placer la caméra au moment du rendu
  public PVector worldPosition;
  public float worldRotation;
  
  public float size;
  public float maxSize;
  public float sizePercent;
  public float rotation; // en degrés
  
  //Couleur
  public PVector hsb;
  
  //IsFocused indique si cette branche est la branche que suit la camera
  public boolean isFocused;
  //CanFall indique si on peut arreter la pousse de cette branche
  public boolean canFall;
  
  public Branch parent;
  public LinkedList<Branch> childs;
  
  public Branch(float size, float rotation) {
    this.size = 0;
    this.rotation = rotation;
    this.parent = null;
    this.childs = new LinkedList<Branch>();
    this.worldPosition = new PVector(0, 0);
    this.hsb = new PVector(0, 20, 100);
    this.maxSize = size;
    this.sizePercent = 0.0;
    this.isFocused = false;
    this.canFall = true;
  }
  
  public Branch() {
    this(DEFAULT_SIZE, 0);
  }
  
  public void setParent(Branch parent) {
    this.parent = parent;
    if (isFocused) {
      //On garde en mémoire la position/rotation de la branche en coordonnées monde afin de placer la caméra au moment du rendu
      worldRotation = rotation + parent.worldRotation;
      worldPosition.x = parent.worldPosition.x + parent.size * cos(radians(parent.worldRotation + 270));
      worldPosition.y = parent.worldPosition.y + parent.size * sin(radians(parent.worldRotation + 270));
    }
  }
  
  public void addChild(Branch child) {
    if (isFocused) {
      isFocused = false;
      child.isFocused = true;
      if (!canFall) {
        child.canFall = false;
        this.hsb = new PVector(0, 0, 100);
      }
    }
    childs.add(child);
    child.setParent(this);
  }
  
  //Animation de la pousse
  public void updateSize(float percent) {
    sizePercent += percent;
    size = maxSize * sizePercent;
  }
  
  public void draw() {
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
