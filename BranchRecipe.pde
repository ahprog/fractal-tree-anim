import java.util.Iterator;

// Pour faire un vrai L-System il faudrait faire une classe de ce genre pour chaque symbole
// Dans ce TP je choisis de n'avoir comme symbole que la branche
abstract class BranchRecipe {
  ArrayList<Rule> rules;
  
  public void digest(FractalTree fractalTree) {
    Iterator<Branch> itr = fractalTree.activeBranches.listIterator();
    LinkedList<Branch> newBranches = new LinkedList<Branch>();
    while(itr.hasNext()) {
      Branch branch = itr.next();      
      newBranches.addAll(rules.get(int(random(rules.size()))).apply(branch));
      fractalTree.deadBranches.add(branch);
      itr.remove();
    }
    fractalTree.activeBranches.addAll(newBranches);
  }
}
