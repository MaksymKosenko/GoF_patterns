abstract class Iterator {
  Object current();
  bool checkNext();
}

abstract class Aggregate {
  Iterator getIteratorA();
  Iterator getIteratorB();
}

class ConcreteAggregate implements Aggregate {
  var _colors = [1, "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet"];

  Iterator getIteratorA() {
    return ConcreteIteratorA(_colors);
  }
  Iterator getIteratorB() {
    return ConcreteIteratorB(_colors);
  }
}

class ConcreteIteratorA implements Iterator {
  int _index = 0;
  var _collection;
  ConcreteIteratorA(List collection){this._collection = collection;}

  bool checkNext() {
    if (_index < _collection.length)
      return true;
    return false;
  }

  Object current() {
    return _collection[_index++];
  }
}

class ConcreteIteratorB implements Iterator {
  var _collection;
  int _index = 0;
  ConcreteIteratorB(List collection){this._collection = collection;}

  bool checkNext() {

    if (_index < _collection.length)
      return true;
    return false;
  }

  Object current() {
    _index ++;
    return _collection[_collection.length - _index];
  }
}

void main(){
  Aggregate aggregate = ConcreteAggregate();
  Iterator iterator = aggregate.getIteratorA();
  while(iterator.checkNext()) {
    print(iterator.current());
  }
  print("\n");
  iterator = aggregate.getIteratorB();
  while(iterator.checkNext()) {
    print(iterator.current());
  }
}
