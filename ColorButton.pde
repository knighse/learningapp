class ColorButton {
  String name;
  color bcolor;
  PVector position = new PVector(width/2, height/2);
  float radius = 300;
  float hradius = 0.5 * radius;
  Runnable onClick;
  
  ColorButton(String name, color bcolor, Runnable onClick) {
    this.name = name;
    this.bcolor = bcolor;
    this.onClick = onClick;
  }
  
  void display() {
    noStroke();
    fill(bcolor);
    ellipse(position.x - hradius, position.y - hradius, radius, radius);
    
    if (mousePressed && mouseX > position.x - hradius && mouseX < position.x + hradius && mouseY > position.y - hradius && mouseY < position.y + hradius) {
      onClick.run();
    }
  }
}
