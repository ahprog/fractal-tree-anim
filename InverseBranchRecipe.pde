/**
 * Exemple de BranchRecipe
 */ 
class InverseBranchRecipe extends BranchRecipe {
  public InverseBranchRecipe() {
    rules = new ArrayList<Rule>();
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 0.7, 200));
        base.addChild(new Branch(base.size * 0.7, -200));
        return base.childs;
      }
    });
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 0.7, -200));
        base.addChild(new Branch(base.size * 0.7, 200));
        return base.childs;
      }
    });
  }
}
