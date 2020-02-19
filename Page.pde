abstract class Page {
  abstract void display();
  abstract void dispose();
  
  boolean shown = true;
  
  void displayIfShown() {
    if (shown) {
      display();
    }
  }
}
