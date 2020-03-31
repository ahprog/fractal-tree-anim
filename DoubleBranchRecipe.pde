import java.util.Iterator;

class DoubleBranchRecipe extends BranchRecipe {
  public DoubleBranchRecipe() {
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {
        return new LinkedList<Branch>();
      }
    });
  }
  
  @Override
  public void digest(FractalTree fractalTree) {
    //TODO : choisir une rule au hasard a chaque fois
    Iterator<Branch> itr = fractalTree.activeBranches.iterator();
    while(itr.hasNext()) {
      Branch branch = itr.next();      
      LinkedList<Branch> newBranches = rules.get(0).apply(branch);
      fractalTree.activeBranches.addAll(newBranches);
      fractalTree.deadBranches.add(branch);
      itr.remove();
    }
  }
}
