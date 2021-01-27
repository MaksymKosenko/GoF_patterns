abstract class Expression {
  void interpret(int value);
}

class Number implements Expression{
  int _number;
  Number(this._number);
  void interpret(int value) {
    print("Value is $value...");
    _number = value;
  }
}

class Add implements Expression {
  Number _number;
  Add(this._number);
  void interpret(int value) {
    print("Adding $value...");
    _number._number += value;
  }
}

class Subtract implements Expression {
  Number _number;
  Subtract(this._number);
  void interpret(int value) {
    print("Subtracting $value...");
    _number._number -= value;
  }
}

void main(){
  var number = Number(0);
  var adder = Add(number);
  var subtracter = Subtract(number);

  number.interpret(number._number);
  adder.interpret(100);
  subtracter.interpret(60);
  adder.interpret(2);

  print("Result :");
  number.interpret(number._number);
}