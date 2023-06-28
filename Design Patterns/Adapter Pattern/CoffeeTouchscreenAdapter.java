public class CoffeeTouchscreenAdapter implements CoffeeMachineInterface {
  private OldCoffeeMachine oldVendingMachine;

  public CoffeeTouchscreenAdapter(OldCoffeeMachine newVendingMachine) {
    oldVendingMachine = newVendingMachine;
  }

  public void chooseFirstSelection() {
    oldVendingMachine.selectA();
  }

  public void chooseSecondSelection() {
    oldVendingMachine.selectB();
  }
}