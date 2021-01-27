class SingletonExample1{
  static final SingletonExample1 _singleton = SingletonExample1._privateConstructor();

  factory SingletonExample1(){
    return _singleton;
  }

  SingletonExample1._privateConstructor(){
    print("initialized");
  }
}

class SingletonExample2{
  static SingletonExample2 _singleton;

  static SingletonExample2 get instance {
    if(_singleton == null)
      _singleton= SingletonExample2._privateConstructor();
    return _singleton;
  }

  SingletonExample2._privateConstructor(){
    print("initialized");
  }
}

class SingletonExample3{
  static SingletonExample3 _singleton;

  SingletonExample3._privateConstructor(){
    print("initialized");
    _singleton = this;
  }
  factory SingletonExample3() => _singleton ?? SingletonExample3._privateConstructor();
}

void main(){
  SingletonExample1 one = SingletonExample1();
  print(one);

  final two = SingletonExample2.instance;
  print(two);

  SingletonExample3 three = SingletonExample3();
  print(three);
}