abstract class Lesson extends Page {
  public String name = "Uninitialized Lesson Object";
  public String desc = "This lesson was not properly initialized, this is a pure Lesson object and should only be used for testing, or the app needs to be resumed & reloaded.";
  public PImage icon = createImage(128, 128, RGB);
  public SoundButton soundButton;
  public boolean inProgress = false;
  public boolean finished = false;
  public int progress = 0;
}
