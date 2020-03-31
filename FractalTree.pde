import java.util.LinkedList;

class FractalTree {
  private int steps;
  
  public LinkedList<Branch> activeBranches;
  public LinkedList<Branch> deadBranches;
  
  public float branchAngle = 20;
  
  public FractalTree(int steps) {
    this.steps = steps;
    activeBranches = new LinkedList<Branch>();
    deadBranches = new LinkedList<Branch>();
    generate();
  }
  
  public FractalTree() {
    this(1);
  }
  
  void generateNextStep() {
    
  }
  
  void generate() {
    Branch root = new Branch(0, 0);
    activeBranches.add(root);
    for (int i = 0; i < steps; i++) {
      generateNextStep();
    }
  }
  
  void draw() {
    for (Branch branch : activeBranches) {
      branch.draw(); 
    }
    for (Branch branch : deadBranches) {
      branch.draw(); 
    }
  }
}
