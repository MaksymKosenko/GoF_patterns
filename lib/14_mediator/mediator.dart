abstract class User{
  Chat _chat;
  String _name;
  bool _isEnable = true;

  bool isEnable()=>_isEnable;

  void setEnable(bool _isEnable){
    this._isEnable = _isEnable;
  }

  User(Chat chat, String name){
    this._chat = chat;
    this._name = name;
  }

  String getName()=> _name;

  void  receiveMessage(String message){
    print("User $_name");
  }

  void sendMessage(String message){
    _chat.broadcastEvent(message, this);
  }
}

class Admin extends User{
  Admin(Chat chat, String name) : super(chat, name);
  void receiveMessage(String message){
    print("admin ${getName()} receive message ${message}");
  }
}

class DefaultUser extends User{
  DefaultUser(Chat chat, String name) : super(chat, name);
  void receiveMessage(String message){
    print("user ${getName()} receive message ${message}");
  }
}

abstract class Chat{
  void broadcastEvent(String message, User user);
}

class TextChat implements Chat{
  User _admin;
  List<User> _users = List();

  void setAdmin(User admin){
    if(admin !=null && admin is Admin){
      this._admin = admin;
    }else print("not enough permission");
  }
  void addUser(User user){
    if(_admin!=null && user is DefaultUser){
      _users.add(user);
    }else print("no admin in chat, or new user is admin");
  }
  @override
  void broadcastEvent(String message, User userTag) {
    if(userTag is Admin){
      for(User user in _users){
        user.receiveMessage("${userTag.getName()}: $message");
      }
    }
    if(userTag is DefaultUser){
      if(_admin.isEnable()){
        _admin.receiveMessage("${userTag.getName()}: $message");
      }
      for(User user in _users){
        if(user != userTag && user.isEnable()){
          user.receiveMessage("${userTag.getName()}: $message");
        }
      }
    }
  }
}

void main(){
  var chat = TextChat();
  var admin = Admin(chat, "newAdmin");
  var user1 = DefaultUser(chat, "userA");
  var user2 = DefaultUser(chat, "UserB");
  var user3 = DefaultUser(chat, "UserC");

  user3.setEnable(false);
  admin.setEnable(true);
  chat.setAdmin(admin);
  chat.addUser(user1);
  chat.addUser(user2);
  chat.addUser(user3);

  admin.sendMessage("Hello all users");
  print("*********************************");
  user1.sendMessage("i'm testing!");
  print("*********************************");
  user3.sendMessage("message3");
}
