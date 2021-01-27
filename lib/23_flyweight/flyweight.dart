import 'dart:math';

abstract class  Bubbles{
  void draw(x,y);
  void move();
}

class PinkBubble implements Bubbles{
  int _speed = 10;
  int _x;
  int _y;
  void draw(x,y){
    print("Pink bubble on cords $x, $y, speed - $_speed");
    this._x = x;
    this._y = y;
  }
  void move(){
    print("Pink bubble on cords ${_x+_speed}, ${_y - _speed}, speed - $_speed");
    _x = _x+ _speed;
    _y = _y- _speed;
  }
}

class GreenBubble implements Bubbles{
  int _x;
  int _y;
  int _speed = 7;
  void draw(x,y){
    print("Green bubble on cords $x, $y, speed - $_speed");
    this._x = x;
    this._y = y;
  }
  void move(){
    print("Green bubble on cords ${_x-_speed}, ${_y + _speed}, speed - $_speed");
    _x = _x- _speed;
    _y = _y+ _speed;
  }
}

class BlueBubble implements Bubbles{
  int _speed = 13;
  int _x;
  int _y;
  void draw(x,y){
    print("Blue bubble on cords $x, $y, speed - $_speed");
    this._x = x;
    this._y = y;
  }
  void move(){
    print("Blue bubble on cords ${_x+_speed}, ${_y + _speed}, speed - $_speed");
    _x = _x+ _speed;
    _y = _y+ _speed;
  }
}

class BubblesFactory{
  Map<String, Bubbles> _bubbles = {};
  Bubbles getBubble(String bubbleName){
    if (_bubbles.containsKey(bubbleName)) {
      //print("existing bubble re-draw");
      return _bubbles[bubbleName];
    }
    var bubble;
    switch(bubbleName){
      case "Pink": bubble = PinkBubble(); break;
      case "Blue": bubble = BlueBubble(); break;
      case "Green": bubble = GreenBubble(); break;
    }
    //print("bubble created");
    _bubbles[bubbleName] = bubble;
    return bubble;
  }
}

void main(){
  var factory = BubblesFactory();

  List<Bubbles> bubbles = [];
  bubbles.add(factory.getBubble("Pink"));
  bubbles.add(factory.getBubble("Pink"));

  bubbles.add(factory.getBubble("Blue"));
  bubbles.add(factory.getBubble("Blue"));

  bubbles.add(factory.getBubble("Green"));
  bubbles.add(factory.getBubble("Green"));

  var random= Random();
  for(var bubble in bubbles){
    int x = random.nextInt(100);
    int y = random.nextInt(100);
    bubble.draw(x, y);
    bubble.move();
    print("*****");
  }
}