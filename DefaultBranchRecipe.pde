class DefaultBranchRecipe extends BranchRecipe {
  public DefaultBranchRecipe() {
    rules = new ArrayList<Rule>();
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 0.7, 20));
        base.addChild(new Branch(base.size * 0.7, -20));
        return base.childs;
      }
    });
  }
}
