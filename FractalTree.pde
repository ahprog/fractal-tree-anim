import java.util.LinkedList;

enum AnimationState {
  PLAYING,
  FINISHED
}

class FractalTree {
  private int steps;
  private int currentStep;
  
  private AnimationState branchGrowthState;
  private float animCursor;
  private float animDuration;
  private float animSpeed = 0.1;
  
  public LinkedList<Branch> activeBranches;
  public LinkedList<Branch> deadBranches;
  
  private Branch root;
  
  public FractalTree(int steps) {
    this.steps = steps;
    this.currentStep = 0;
    this.animDuration = 1.0;
    this.animCursor = 0.0;
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
    root.isFocused = true;
    
    activeBranches.add(root);
    launchAnim();
  }
  
  void generateNextStep() {
    // TODO : ici on devrait pouvoir choisir quelle recette on veut pour chaque step
    if (currentStep < steps) {
      currentStep++;
      BranchRecipe recipe = new DoubleBranchRecipe();
      recipe.digest(this);
      
      launchAnim();
    }
  }
  
  void launchAnim() {
      TravellingEffect.focusBranch.resetColor();
      Branch baseFocusBranch = (activeBranches.size() == 0) ? deadBranches.getLast() : activeBranches.get(0);
      baseFocusBranch.hsb = new PVector(0, 100, 100);
      TravellingEffect.focusBranch = baseFocusBranch;
      
      animCursor = 0;
      branchGrowthState = AnimationState.PLAYING;
  }
  
  void draw() {
    if (branchGrowthState == AnimationState.PLAYING) {
      if (animCursor < animDuration) {
        // Animation
        for (Branch branch : activeBranches) {
          branch.updateSize(0.1 * animSpeed);  
        }
        animCursor += 0.1 * animSpeed;
      }
      else {
        // Quand l'anim est finie
        branchGrowthState = AnimationState.FINISHED;
        generateNextStep();
      }
    }
    root.draw();
  }
}
