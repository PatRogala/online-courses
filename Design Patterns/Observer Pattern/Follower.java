public class Follower implements Observer {
  private String followerName;

  public Follower(String followerName) {
    this.followerName = followerName;
  }

  public void update(String status) {
    System.out.println(followerName + " has received an update: " + status);
  }

  public void play() {
    System.out.println(followerName + " is playing.");
  }
}