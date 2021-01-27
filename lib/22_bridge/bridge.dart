abstract class TextStyle{
  FontStyle _style;
  String _text;
  int _size;
  TextStyle(FontStyle style, String text){
    this._style = style;
    this._text = text;
  }
  void showStyle();
  void showInfo(){
    showStyle();
    _style.setStyle();
  }
}

class HeaderText extends TextStyle{
  int _size = 20;
  HeaderText(FontStyle style, String text) : super(style, text);
  void showStyle(){
    print("$_text, style - Header, size $_size");
  }
}
class CommonText extends TextStyle{
  int _size = 16;
  CommonText(FontStyle style, String text) : super(style, text);
  void showStyle(){
    print("$_text, style - Common, size $_size");
  }
}
class SubText extends TextStyle{
  int _size = 12;
  SubText(FontStyle style, String text) : super(style, text);
  void showStyle(){
    print("$_text, style - Sub, size $_size");
  }
}


abstract class FontStyle{
  void setStyle();
}

class Bold implements FontStyle{
  void setStyle(){
    print("fontWeight: FontWeight.bold");
  }
}

class Italic implements FontStyle{
  void setStyle(){
    print("fontStyle: FontStyle.italic");
  }
}

class RedColor implements FontStyle{
  void setStyle(){
    print("color: Colors.red");
  }
}

void main(){
  var textStyle = HeaderText(RedColor(), "Greetings");
  textStyle.showInfo();
  print("*****");
  var commonStyle = CommonText(Bold(), "body text");
  commonStyle.showInfo();
  print("*****");
  var authors = SubText(Italic(), "Maksym");
  authors.showInfo();
}