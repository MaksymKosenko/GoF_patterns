abstract class Order{
  void operation();
}

class PizzaOrder extends Order{
  int _number ;
  @override
  void operation() {
    print("Order #$_number");
  }
  PizzaOrder(int number){
    this._number = number;
  }
}

abstract class Decorator extends Order{
  Order _order;
  String _status;
  @override
  void operation();
  Decorator();
}

class CookingDecorator extends Decorator{
  String _status = "cooking";
  int _time;
  @override
  void operation() {
    _order.operation();
    print("status - $_status, wait for $_time minutes");
  }
  CookingDecorator(Order order, int time){
    this._time = time;
    this._order = order;
  }
}

class DeliveryDecorator extends Decorator {
  String _status = "delivering";
  String _courier ;
  @override
  void operation() {
    _order.operation();
    print("status - $_status, courier - $_courier");
  }

  DeliveryDecorator(Order order, String courier) {
    this._order = order;
    this._courier = courier;
  }
}

class FinishedDecorator extends Decorator{
  String _status = "finished";
  @override
  void operation() {
    _order.operation();
    print("status - $_status, thanks for using our system");
  }
  FinishedDecorator(Order order){
    this._order = order;
  }
}

class CanceledDecorator extends Decorator{
  String _status = "closed";
  @override
  void operation() {
    _order.operation();
    print("status - $_status, thanks for using our system");
  }
  CanceledDecorator(Order order){
    this._order = order;
  }
}
void main(){
  var order = PizzaOrder(1);
  var decorator = CookingDecorator(order, 15);
  decorator.operation();
  print("****************");
  var decorator2 = DeliveryDecorator(order, "Vasya Dostavshik");
  decorator2.operation();
  print("****************");
  var decorator3 = FinishedDecorator(order);
  // var decorator3 = CanceledDecorator(order);
  decorator3.operation();
  print("****************");
  var decorator4 = FinishedDecorator(DeliveryDecorator(CookingDecorator(order, 10), "new courierName"));
  decorator4.operation();
}