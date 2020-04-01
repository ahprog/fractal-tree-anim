class DryBranchRecipe extends BranchRecipe {
  public DryBranchRecipe() {
    rules = new ArrayList<Rule>();
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 0.9, 5));
        base.addChild(new Branch(base.size * 0.8, -5));
        return base.childs;
      }
    });
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 0.7, 5));
        base.addChild(new Branch(base.size * 0.8, -5));
        return base.childs;
      }
    });
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 0.9, 7));
        return base.childs;
      }
    });
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 0.9, -7));
        return base.childs;
      }
    });
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {
        return base.childs;
      }
    });
  }
}
