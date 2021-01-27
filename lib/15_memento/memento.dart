class Game{
  int _lvl;
  String _percent;

  void createSave(int lvl, String percent){
    this._lvl = lvl;
    this._percent = percent;
  }
  void loadSave(Save save){
    _lvl = save.lvl;
    _percent = save.percent;
  }
  Save save(){
    return Save(_lvl, _percent);
  }
  String result(){
    return "game status: lvl - ${_lvl}, ${_percent}";
  }
}

class Save{
  int _lvl;
  String _percent;

  Save(int lvl, String percent){
    this._lvl = lvl;
    this._percent = percent;
  }
  int get lvl => _lvl;
  String get percent => _percent;

}

class SaveKeeper{
  Save _save;
  Save getSave()=> _save;
  setSave(Save save){
    this._save = save;
  }
}

void main(){
  var game = Game();

  game.createSave(2, "30 %");
  print(game.result());

  var saveKeeper = SaveKeeper();
  saveKeeper.setSave(game.save());

  game.createSave(3, "60%");
  print(game.result());

  game.loadSave(saveKeeper.getSave());
  print(game.result());

}