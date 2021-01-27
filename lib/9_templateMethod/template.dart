abstract class Template{
  /* String step1(){
    return "step 1";
  }*/
  String step1()=>"Step 1";
  String step2()=>"Step 2";
  String step3()=>"Step 3";
  void templateMethod(){
    print(step1());
    print(step2());
    print(step3());
  }
}

class ConcreteTemplateA extends Template{
  String step2()=>"Step 2 changed to 2.2";
  String step3()=>"Step 3 changed to 3.2";
}

class ConcreteTemplateB extends Template{
  String step1()=>"Step 1 is changed to 1.5";
}

void main(){
  Template one = ConcreteTemplateA();
  one.templateMethod();
  print("\n");
  Template two = ConcreteTemplateB();
  two.templateMethod();
}