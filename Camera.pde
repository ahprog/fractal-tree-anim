class Camera {
  public PVector position;
  public float rotation; // l'angle de rotation est en degrés
  public PVector backgroundColor;
  
  public Camera(float x, float y) {
    this.position = new PVector(x, y);
    this.rotation = 0;
    this.backgroundColor = new PVector(0, 0, 0);
    
    TravellingEffect.focusBranch = new Branch();
  }  

  public Camera() {
    this(0, 0);
  }
  
  public void move(PVector offset) {
    position.add(offset);
  }

  public void setBackgroundColor(float h, float s, float b) {
    backgroundColor = new PVector(h, s, b);
  }
}
