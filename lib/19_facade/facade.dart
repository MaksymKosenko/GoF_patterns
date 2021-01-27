class User{
  String _name;
  String _card;
  double _balance = 0;
  User(String name, String card){
    this._name = name;
    this._card = card;
  }
}

class TransAction{
  User _user1;
  User _user2;
  double _money;
  TransAction(User user1, User user2, double money){
    this._user1 = user1;
    this._user2 = user2;
    this._money = money;
  }
  void transAction(User _user1, User _user2){
    print("User ${_user1._name} from card ${_user1._card} transacted to ${_user2._name}, ${_user2._card} $_money dolars");
    _user1._balance = _user1._balance - _money;
    _user2._balance = _user2._balance + _money;
  }
}

class Account{
  String _number;
  Account(String number){
    this._number = number;
  }
}

class Deposit{
  double _balance;
  User _user;
  Account _account;
  Deposit(User user, Account account, double money){
    this._account = account;
    this._user = user;
    this._balance = money;
  }
  void depositeTo(User user, Account account){
    print("User ${_user._name} from card ${_user._card} deposited to ${_account._number} $_balance dolars");
    _user._balance = _user._balance - _balance;
    _balance = _balance + _balance;
  }
}

class Facade{
  User _user1 = User("User A", "1111 2222 3333 4444");
  User _user2 = User("User B", "9999 8888 7777 6666");
  TransAction _transAction;
  Account _account = Account("12345678");
  Deposit _deposit;

  void userTransactionV1(){
    _transAction = TransAction(_user1, _user2, 125);
    _transAction.transAction(_user1, _user2);
  }
  void userTransactionV2(){
    _transAction = TransAction(_user1, _user2, 125);
    _transAction.transAction(_user2, _user1);
  }
  void depositV1(){
    _deposit = Deposit(_user1, _account, 100);
    _deposit.depositeTo(_user1, _account);
  }
  void depositV2(){
    _deposit = Deposit(_user2, _account, 100);
    _deposit.depositeTo(_user2, _account);
  }
  void printUserBalanceV1(){
    print("U1 balance: ${_user1._balance}");
  }
  void printUserBalanceV2(){
    print("U2 balance: ${_user2._balance}");
  }
  void printAccountBalance(){
    print("A balance:${_deposit._balance}");

  }
}

void main(){
  Facade facade = Facade();
  facade.depositV1();
  facade.depositV2();
  facade.userTransactionV1();
  facade.userTransactionV2();
  facade.printUserBalanceV1();
  facade.printUserBalanceV2();
  facade.printAccountBalance();
}