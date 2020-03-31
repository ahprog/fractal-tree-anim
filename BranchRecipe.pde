// Pour faire un vrai L-System il faudrait faire une classe de ce genre pour chaque symbole
// Dans ce TP je choisis de n'avoir comme symbole que la branche
abstract class BranchRecipe {
  ArrayList<Rule> rules;
  
  public void digest(FractalTree fractalTree) {}
}
