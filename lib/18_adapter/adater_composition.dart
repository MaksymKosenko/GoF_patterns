abstract class Target{
  void operation();
}
class Adaptee{
  void operationToAdapt(){
    print("simple example");
  }
}

class ConcreteAdapter implements Target{
  Adaptee _adaptee = Adaptee();
  void operation(){
    _adaptee.operationToAdapt();
  }
}

void main(){
  var adapter = ConcreteAdapter();
  adapter.operation();
}