abstract class Prototype{
  Prototype clone();
  String _name;
  int _tag;
}

class ConcretePrototype implements Prototype{
  String _name;
  int _tag;
  ConcretePrototype(this._name, this._tag);

  Prototype clone() {
    ConcretePrototype clone = ConcretePrototype(_name, _tag);
    return clone;
  }
}

void main(){
  var original = ConcretePrototype("zxc", 1);
  var clone = original.clone();
  print("original name : ${original._name}, tag - ${original._tag}");
  print("clone name : ${clone._name}, tag - ${clone._tag}");
}