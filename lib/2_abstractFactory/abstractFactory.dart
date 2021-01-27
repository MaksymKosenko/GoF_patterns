import 'dart:io';

abstract class Device{
  void doSomething();
}

class BadKeyboard implements Device{
  void doSomething(){
    print("I'm bad keyboard. My buttons is broken");
  }
}

class BadMouse implements Device{
  void doSomething(){
    print("I'm bad mouse. My wire is broken");
  }
}

class BadTouchpad implements Device{
  void doSomething(){
    print("I'm bad touchpad. A few touches not detected");
  }
}

class GoodKeyboard implements Device{
  void doSomething(){
    print("I'm good keyboard. My buttons is beautiful");
  }
}

class GoodMouse implements Device{
  void doSomething(){
    print("I'm good mouse. My lightning is beautiful");
  }
}

class GoodTouchpad implements Device{
  void doSomething(){
    print("I'm good touchpad. Everything is good with me");
  }
}

abstract class DeviceFactory{
  Device createKeyboard();
  Device createMouse();
  Device createTouchpad();
}

class AmateurDeviceFactory implements DeviceFactory{
  Device createKeyboard() {
    return BadKeyboard();
  }
  Device createMouse() {
    return BadMouse();
  }
  Device createTouchpad() {
    return BadTouchpad();
  }
}

class ProfessionalDeviceFactory implements DeviceFactory{
  Device createKeyboard() {
    return GoodKeyboard();
  }
  Device createMouse() {
    return GoodMouse();
  }
  Device createTouchpad() {
    return GoodTouchpad();
  }
}
void main(){
  print("cheap or expensive?");
  var answer = stdin.readLineSync();
  DeviceFactory deviceFactory;
  switch(answer){
    case "cheap" : deviceFactory = AmateurDeviceFactory(); break;
    case "expensive" : deviceFactory = ProfessionalDeviceFactory(); break;
  }
  print("choose device - 1)Mouse 2)Keyboard 3)Touchpad");
  answer = stdin.readLineSync();
  Device device;
  switch(answer){
    case "1": device = deviceFactory.createMouse(); break;
    case "2": device = deviceFactory.createKeyboard(); break;
    case "3": device = deviceFactory.createTouchpad(); break;
  }
  device.doSomething();
}