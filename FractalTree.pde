import java.util.LinkedList;

class FractalTree {
  private int steps;
  
  public LinkedList<Branch> activeBranches;
  public LinkedList<Branch> deadBranches;
  
  public float branchAngle = 20;
  
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
    activeBranches.add(root);
    for (int i = 0; i < steps; i++) {
      generateNextStep();
    }
  }
  
  void generateNextStep() {
    // TODO : ici on devrait pouvoir choisir quelle recette on veut pour chaque step
    BranchRecipe recipe = new DoubleBranchRecipe();
    recipe.digest(this);
  }
  
  void draw() {
    root.draw();
  }
}
