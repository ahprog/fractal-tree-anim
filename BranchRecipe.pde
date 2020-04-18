import java.util.Iterator;

/**
 * Les classes dérivées de BranchRecipe représentent les règles de réécriture d'une branche 
 * Pour faire un vrai L-System il faudrait faire une classe de ce genre pour chaque symbole
 * Dans ce TP je choisis de n'avoir comme symbole que la branche
 */
abstract class BranchRecipe {
  //Règles de réécriture (voir DefaultBranchRecipe pour un exemple d'utilisation)
  ArrayList<Rule> rules;
  
  //Produit les branches filles des branches qui poussent du fractal tree
  public void digest(FractalTree fractalTree) {
    Iterator<Branch> itr = fractalTree.activeBranches.listIterator();
    LinkedList<Branch> newBranches = new LinkedList<Branch>();
    while(itr.hasNext()) {
      Branch branch = itr.next();      
      newBranches.addAll(rules.get(int(random(rules.size()))).apply(branch));
      itr.remove();
    }
    fractalTree.activeBranches.addAll(newBranches);
  }
}
