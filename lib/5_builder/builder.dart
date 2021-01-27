class Car {
  String _name;
  int _maxSpeed;
  int _yearOfRelease;

  void setName(String name) {
    this._name = name;
  }

  void setMaxSpeed(int maxSpeed) {
    this._maxSpeed = maxSpeed;
  }

  void setYOR(int yearOfRelease) {
    this._yearOfRelease = yearOfRelease;
  }
}

abstract class CarBuilder {
  Car _car;

  void begin() {
    _car = Car();
  }

  void buildName();

  void buildSpeed();

  void buildYear();

  Car getCar() {
    return _car;
  }
}

class MercedesBuilder extends CarBuilder {
  void buildName() {
    _car.setName("Mercedes");
  }

  void buildSpeed() {
    _car.setMaxSpeed(320);
  }

  void buildYear() {
    _car.setYOR(2020);
  }
}

class FerrariBuilder extends CarBuilder {
  void buildName() {
    _car.setName("Ferrari");
  }

  void buildSpeed() {
    _car.setMaxSpeed(360);
  }

  void buildYear() {
    _car.setYOR(2018);
  }
}

class Director{
  CarBuilder _builder;
  void setBuilder(CarBuilder b){
    _builder = b;
  }

  Car BuildCar(){
    _builder.begin();
    _builder.buildName();
    _builder.buildSpeed();
    _builder.buildYear();
    Car _car = _builder.getCar();
    return _car;
  }
}

void main(){
  Director director = Director();
  director.setBuilder(MercedesBuilder());
  Car car = director.BuildCar();
  //car.setName("newName");
  print("${car._name} with ${car._maxSpeed} max speed ${car._yearOfRelease} - year of release");
  print("${car._name} with ${car._maxSpeed} max speed ${car._yearOfRelease} - year of release");
  print("${car._name} with ${car._maxSpeed} max speed ${car._yearOfRelease} - year of release");
}