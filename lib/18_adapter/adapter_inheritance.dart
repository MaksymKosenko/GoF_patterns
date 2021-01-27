abstract class Target{
  void operation();
}

class Adaptee{
  void operationToAdapt(){
    print("simple example");
  }
}
class ConcreteAdapter extends Adaptee implements Target {
  void operation(){
    operationToAdapt();
  }
}
void main(){
  var adapter = ConcreteAdapter();
  adapter.operation();
}