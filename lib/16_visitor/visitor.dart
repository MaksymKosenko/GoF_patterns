abstract class Element{
  String _name;
  void accept(Visitor visitor) => visitor.visit(this);
}

abstract class Visitor{
  void visit(Element element);
}

class Motherboard extends Element{
  String _name = "Gigabyte";
//Motherboard(this._name);
}

class Cpu extends Element{
  String _name = "Intel core i7 6500 uq";
//Cpu(this._name);
}

class Gpu extends Element{
  String _name = "Nvidia geforce gtx 940mx";
//Gpu(this._name);
}

class Pc implements Element{
  String _name = "PC";
  List<Element> _pcElements;

  Pc(){
    _pcElements = List.from([Motherboard(), Cpu(), Gpu()]);
  }
  void accept(Visitor visitor) {
    for (var pcElement in _pcElements) {
      pcElement.accept(visitor);
    }
    visitor.visit(this);
  }
}

class User implements Visitor{
  void visit(Element element) {
    if(element is Motherboard){
      print("motherboard ${element._name}");
    }
    if(element is Cpu){
      print("what is ${element._name}");
    }
    if(element is Gpu){
      print("bad gpu ${element._name}");
    }
  }
}

class Dealer implements Visitor{
  void visit(Element element) {
    if(element is Motherboard){
      print("Awesome motherboard ${element._name}");
    }
    if(element is Cpu){
      print("Very powerful cpu ${element._name}");
    }
    if(element is Gpu){
      print("Enough productively gpu ${element._name}");
    }
  }
}
void main(){
  var pc = Pc();
  pc.accept(User());
  print("***********");
  pc.accept(Dealer());
}
