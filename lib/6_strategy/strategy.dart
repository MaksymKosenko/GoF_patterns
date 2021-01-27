abstract class TeaStrategy {
  void showTea(String teaSort);
}

class GreenTeaStrategy implements TeaStrategy{
  void showTea(String teaSort) {
    print("there is green tea from $teaSort leaf");
  }
}

class BlackTeaStrategy implements TeaStrategy{
  void showTea(String teaSort) {
    print("there is black tea from $teaSort leaf");
  }
}

class YellowTeaStrategy implements TeaStrategy{
  void showTea(String teaSort) {
    print("there is yellow tea from $teaSort leaf");
  }
}

class TeaClient{
  TeaStrategy _strategy;
  void setStrategy(TeaStrategy s){
    _strategy = s;
  }
  void doTea(String tea){
    _strategy.showTea(tea);
  }
}

void main(){
  TeaClient client = TeaClient();
  client.setStrategy(GreenTeaStrategy());
  client.doTea("bamboo");
  client.setStrategy(BlackTeaStrategy());
  client.doTea("bamboo");
  client.setStrategy(YellowTeaStrategy());
  client.doTea("bamboo");
}