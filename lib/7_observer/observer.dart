abstract class Observer{
  void handleEvent(int temp);
}

class CelsiusObserver implements Observer{
  void handleEvent(int temp) {
    print("temperature is ${temp} °C");
  }
}
class KelvinObserver implements Observer{
  void handleEvent(int temp) {
    print("temperature is ${temp + 273} °K");
  }
}
class FahrenheitObserver implements Observer{
  void handleEvent(int temp) {
    print("temperature is ${temp * 1.8 + 32} °F");
  }
}

abstract class Observed{
  void addObserver(Observer o);
  void removeObserver(Observer o);
  void notifyObserver();
}

class ObservedTemperature implements Observed{
  int _temperature;
  List <Observer> _observers = List();

  void setTemp(int t){
    _temperature = t;
    notifyObserver();
  }

  void addObserver(Observer o) {
    _observers.add(o);
  }
  void removeObserver(Observer o) {
    _observers.remove(o);
  }
  void notifyObserver() {
    for(Observer o in _observers)
      o.handleEvent(_temperature);
  }
}

void main(){
  ObservedTemperature observedTemperature = ObservedTemperature();
  observedTemperature.addObserver(CelsiusObserver());
  print("set some temp");
  observedTemperature.setTemp(-2);
  print("set new temp and add new observer");
  observedTemperature.addObserver(FahrenheitObserver());
  observedTemperature.setTemp(3);
  print("remove one old observer, add new one and change temp");
  observedTemperature.removeObserver(CelsiusObserver());
  observedTemperature.addObserver(KelvinObserver());
  observedTemperature.setTemp(40);
}