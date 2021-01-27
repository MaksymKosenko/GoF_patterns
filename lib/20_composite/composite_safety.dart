abstract class Component {
  void operation();
}

class Leaf implements Component {
  String _name;
  Leaf(String name) {
    this._name = name;
  }
  void operation() {
    print("i'm leaf $_name");
  }
}

class Composite implements Component {
  List<Component> _components = List();

  void operation() {
    for (Component component in _components) {
      component.operation();
    }
  }

  void addChild(Component component) {
    _components.add(component);
  }

  void removeChild(Component component) {
    _components.remove(component);
  }
}

void main(){
  var one = Leaf("1");
  var two = Leaf("2");
  var three = Leaf("3");

  var c1 = Composite();
  var c2 = Composite();
  var c3 = Composite();
  c1.addChild(one);
  c1.addChild(two);

  c2.addChild(two);
  c2.addChild(three);

  c3.addChild(c2);
  c3.addChild(c1);

  c3.operation();
}