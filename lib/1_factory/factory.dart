abstract class Watch {
  void showTime();
}

class ElectronicWatch implements Watch {
  void showTime() {
    print("Electronic watch!");
  }
}

class WallClock implements Watch {
  void showTime() {
    print("Wall clock!");
  }
}

abstract class Factory {
  Watch create();
}

class ClockFactory implements Factory {
  Watch create() {
    return WallClock();
  }
}

class ElectronicFactory implements Factory {
  Watch create() {
    return ElectronicWatch();
  }
}

void main() {
  chooseFactory(ElectronicFactory());
  chooseFactory(ClockFactory());
}

void chooseFactory(factory) {
  Watch watch = factory.create();
  watch.showTime();
}