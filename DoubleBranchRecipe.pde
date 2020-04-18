/**
 * Exemple de BranchRecipe
 */ 
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
        base.addChild(new Branch(base.size * 0.8, -30));
        base.addChild(new Branch(base.size * 0.8, 20));
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
}
