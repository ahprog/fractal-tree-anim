/**
 * Exemple de BranchRecipe
 */ 
class SpirographBranchRecipe extends BranchRecipe {
  public SpirographBranchRecipe() {
    rules = new ArrayList<Rule>();
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 1.0, 250));
        return base.childs;
      }
    });
  }
}
