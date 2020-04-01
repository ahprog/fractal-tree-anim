import java.util.ListIterator;

class DoubleBranchRecipe extends BranchRecipe {
  public DoubleBranchRecipe() {
    rules = new ArrayList<Rule>();
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 0.7, 20));
        base.addChild(new Branch(base.size * 0.7, -20));
        return base.childs;
      }
    });
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 0.8, 30));
        base.addChild(new Branch(base.size * 0.8, -20));
        return base.childs;
      }
    });
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 0.8, 20));
        base.addChild(new Branch(base.size * 0.8, -30));
        return base.childs;
      }
    });
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 0.5, -10));
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
      newBranches.addAll(rules.get(int(random(rules.size()))).apply(branch));
      fractalTree.deadBranches.add(branch);
      itr.remove();
    }
    fractalTree.activeBranches.addAll(newBranches);
  }
}
