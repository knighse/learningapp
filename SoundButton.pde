class SoundButton {
  SoundFile audioFile;
  PVector position = new PVector(width/2, height/2);
  float buttonSize = 150;
  float hbuttonSize = 0.5 * buttonSize;
  
  SoundButton(String fileName) {
    this.audioFile = new SoundFile(applet, fileName);
  }
  
  void dispose() {
    audioFile.stopPlayer();
  }
  
  void display() {
    image(audioImg, position.x - hbuttonSize, position.y - hbuttonSize, buttonSize, buttonSize);
    
    if (mousePressed && mouseX > position.x - hbuttonSize && mouseX < position.x + hbuttonSize && mouseY > position.y - hbuttonSize && mouseY < position.y + hbuttonSize) {
      audioFile.play();
    }
  }
}
