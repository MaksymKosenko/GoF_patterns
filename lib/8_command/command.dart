class Speaker {
  void turnOn() {
    print(" Speaker on");
  }

  void upVolume() {
    print(" + volume");
  }

  void downVolume() {
    print(" - volume");
  }

  void turnOff() {
    print(" Speaker off");
  }
}

abstract class Command {
  void execute();
}

class CommandOn implements Command {
  Speaker _speaker;
  CommandOn(this._speaker);
  void execute(){
    _speaker.turnOn();
  }
}
class CommandOff implements Command {
  Speaker _speaker;
  CommandOff(this._speaker);
  void execute(){
    _speaker.turnOff();
  }
}
class CommandUp implements Command {
  Speaker _speaker;
  CommandUp(this._speaker);
  void execute(){
    _speaker.upVolume();
  }
}
class CommandDown implements Command {
  Speaker _speaker;
  CommandDown(this._speaker);
  void execute(){
    _speaker.downVolume();
  }
}

class User{
  Command _on;
  Command _off;
  Command _up;
  Command _down;

  User(this._on, this._off, this._up, this._down);

  void turnOnSpeaker(){
    _on.execute();
  }
  void turnOffSpeaker(){
    _off.execute();
  }
  void volumeUpSpeaker(){
    _up.execute();
  }
  void volumeDownSpeaker(){
    _down.execute();
  }
}

void main(){
  Speaker speaker = Speaker();
  User user = User(CommandOn(speaker), CommandOff(speaker), CommandUp(speaker), CommandDown(speaker));
  user.turnOnSpeaker();
  user.volumeUpSpeaker();
  user.volumeDownSpeaker();
  user.turnOffSpeaker();
}