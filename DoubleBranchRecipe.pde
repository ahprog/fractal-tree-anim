import java.util.ListIterator;

class DoubleBranchRecipe extends BranchRecipe {
  public DoubleBranchRecipe() {
    rules = new ArrayList<Rule>();
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch());
        return base.childs;
      }
    });
  }
  
  @Override
  public void digest(FractalTree fractalTree) {
    //TODO : choisir une rule au hasard a chaque fois
    ListIterator<Branch> itr = fractalTree.activeBranches.listIterator();
    LinkedList<Branch> newBranches = new LinkedList<Branch>();
    while(itr.hasNext()) {
      Branch branch = itr.next();      
      newBranches.addAll(rules.get(0).apply(branch));
      fractalTree.deadBranches.add(branch);
      itr.remove();
    }
    fractalTree.activeBranches.addAll(newBranches);
  }
}
