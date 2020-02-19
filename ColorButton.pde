class ColorButton {
  String name;
  color bcolor;
  PVector position = new PVector(width/2, height/2);
  float radius = 50;
  float hradius = 0.5 * radius;
  
  ColorButton(String name, color bcolor) {
    this.name = name;
    this.bcolor = bcolor;
  }
  
  void display() {
    noStroke();
    fill(bcolor);
    ellipse(position.x - hradius, position.y - hradius, radius, radius);
  }
}
