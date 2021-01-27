abstract class Page{
  void load();
}

class TemplatePage implements Page{
  String _path;

  TemplatePage(String path){
    this._path = path;
  }

  void load(){
    print("loading page from $_path");
  }
}

class ProxyPage implements Page{
  String _path;
  TemplatePage _subPage;

  ProxyPage(this._path);

  void load(){
    print("loading proxy page from $_path");
    _subject().load();
  }

  TemplatePage _subject(){
    if(_subPage != null){
      return _subPage;
    }
    else{
      print("creating an instance of TemplatePage for a Proxy");
      _subPage = TemplatePage(_path);
      return _subPage;
    }
  }
}

void main(){
  var proxy = ProxyPage("Random/path");
  proxy.load();
  print("***");
  proxy.load();
}