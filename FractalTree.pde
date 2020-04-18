import java.util.LinkedList;
import java.util.ListIterator;

enum AnimationState {
  PLAYING, 
    FINISHED
}

/**
 * Gère l'animation de la pousse d'un fractal tree
 */
class FractalTree {
  private FractalTreeAnim app;

  private int steps;
  private int currentStep;

  //Animation
  private AnimationState branchGrowthState;
  private float animCursor;
  private float animDuration;
  private float animSpeed;
  private float animSpeedCoeff;

  //On stocke dans cette liste les branches "au sommet" de l'arbre ; celles qui poussent et qui peuvent générer d'autre branches
  public LinkedList<Branch> activeBranches;

  private final int MAX_PUSH_MATRIX = 30; // on ne peut appeler push_matrix que 32 fois
  private final int MAX_ACTIVE_BRANCHES = 200;
  private final int MIN_ACTIVE_BRANCHES = 100;

  private Branch root;

  public FractalTree(int steps, FractalTreeAnim app) {
    this.app = app;
    this.steps = steps;
    this.animDuration = 1.0;
    this.animCursor = 0.0;
    this.animSpeed = 0.1;
    this.animSpeedCoeff = 0.1;
    generate();
  }

  public FractalTree(FractalTreeAnim app) {
    this(50, app);
  }

  // Lancement de l'animation de l'arbre 
  void generate() {
    activeBranches = new LinkedList<Branch>();
    root = new Branch();
    root.isFocused = true;
    root.canFall = false;
    currentStep = 0;
    TravellingEffect.focusBranch = root;

    activeBranches.add(root);
    launchAnim();
  }

  //Est appelé quand l'animation de pousse d'un étage de l'arbre est finie
  void generateNextStep() {
    if (currentStep >= MAX_PUSH_MATRIX) {
      app.reset();
      generate(); 
      return;
    }
    if (currentStep < steps) {
      currentStep++;
      //On limite le nombre de branches qui poussent par soucis des performances
      if (activeBranches.size() > MAX_ACTIVE_BRANCHES) {
        activeBranches.subList(MIN_ACTIVE_BRANCHES, activeBranches.size()).clear();
      }
      
      //On génère les nouvelles branches
      BranchRecipe recipe = new DoubleBranchRecipe();
      recipe.digest(this);

      launchAnim();
    }
  }

  //Initialisation de l'animation d'un nouvel étage de l'arbre
  void launchAnim() {
    TravellingEffect.focusBranch.resetColor();
    Branch baseFocusBranch = activeBranches.get(0);
    baseFocusBranch.hsb = new PVector(0, 100, 100);
    TravellingEffect.focusBranch = baseFocusBranch;

    animCursor = 0;
    branchGrowthState = AnimationState.PLAYING;
  }

  void draw() {
    //Animation
    if (branchGrowthState == AnimationState.PLAYING) {
      if (animCursor < animDuration) {
        // Animation
        for (Branch branch : activeBranches) {
          branch.updateSize(animSpeed * animSpeedCoeff);
        }
        animCursor += animSpeed * animSpeedCoeff;
      } else {
        // Quand l'anim est finie
        branchGrowthState = AnimationState.FINISHED;
        generateNextStep();
      }
    }

    root.draw();
  }

  Branch findNextRoot(Branch branch) {
    for (Branch child : branch.childs) {
      if (!child.canFall) return child;
    }
    return null;
  }
}
