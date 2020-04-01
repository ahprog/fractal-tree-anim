import java.util.LinkedList;

class FractalTree {
  private int steps;
  
  public LinkedList<Branch> activeBranches;
  public LinkedList<Branch> deadBranches;
  
  private Branch root;
  
  public FractalTree(int steps) {
    this.steps = steps;
    activeBranches = new LinkedList<Branch>();
    deadBranches = new LinkedList<Branch>();
    root = new Branch();
    generate();
  }
  
  public FractalTree() {
    this(1);
  }
  
  // Generation
  void generate() {
    activeBranches = new LinkedList<Branch>();
    deadBranches = new LinkedList<Branch>();
    root = new Branch();
    
    activeBranches.add(root);
    for (int i = 0; i < steps; i++) {
      generateNextStep();
    }

    Branch baseFocusBranch = (activeBranches.size() == 0) ? deadBranches.getLast() : activeBranches.get(0);
    
    baseFocusBranch.hsb = new PVector(0, 100, 100);
    TravellingEffect.focusPoint.x = baseFocusBranch.worldPosition.x + baseFocusBranch.size * cos(radians(baseFocusBranch.worldRotation + 270));
    TravellingEffect.focusPoint.y = baseFocusBranch.worldPosition.y + baseFocusBranch.size * sin(radians(baseFocusBranch.worldRotation + 270));
  }
  
  void generateNextStep() {
    // TODO : ici on devrait pouvoir choisir quelle recette on veut pour chaque step
    //BranchRecipe recipe = new DryBranchRecipe();
    BranchRecipe recipe = new DoubleBranchRecipe();
    recipe.digest(this);
  }
  
  void draw() {
    root.draw();
  }
}
