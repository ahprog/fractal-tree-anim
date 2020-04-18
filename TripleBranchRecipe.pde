/**
 * Exemple de BranchRecipe
 */ 
class TripleBranchRecipe extends BranchRecipe {
  public TripleBranchRecipe() {
    rules = new ArrayList<Rule>();
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 0.7, 20));
        base.addChild(new Branch(base.size * 0.8, 4));
        base.addChild(new Branch(base.size * 1, -20));
        return base.childs;
      }
    });
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 0.8, -20));
        base.addChild(new Branch(base.size * 0.6, 4));
        base.addChild(new Branch(base.size * 1.2, 20));
        return base.childs;
      }
    });
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 0.7, -50));
        base.addChild(new Branch(base.size * 0.7, 30));
        base.addChild(new Branch(base.size * 1.1, 10));
        return base.childs;
      }
    });
    rules.add(new Rule() {
      @Override
      LinkedList<Branch> apply(Branch base) {        
        base.addChild(new Branch(base.size * 0.9, 0));
        base.addChild(new Branch(base.size * 0.7, -10));
        return base.childs;
      }
    });
  }
  
  
  
  
}
