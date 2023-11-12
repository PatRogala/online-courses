public class Channel implements Subject {
  private ArrayList<Observer> observers;
  private String channelName;
  private String status;

  public Channel(String channelName) {
    observers = new ArrayList<Observer>();
    this.channelName = channelName;
  }

  public void registerObserver(Observer o) {
    observers.add(o);
  }

  public void removeObserver(Observer o) {
    observers.remove(o);
  }

  public void notifyObservers() {
    for (Observer o : observers) {
      o.update(status);
    }
  }

  public void setStatus(String status) {
    this.status = status;
    notifyObservers();
  }
}