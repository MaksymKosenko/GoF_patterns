enum Levels{
  Info, Debug, Error
}
abstract class Logger{
  Set<Levels> _levels;
  Logger _next;
  Logger(this._levels);

  void set next(Logger nextLogger) => _next = nextLogger;

  void addLevel(Levels level) => _levels.add(level);

  void log(Levels level, String msg){
    if(_levels.contains(level)){
      write_message(msg);
    }
    // _next?.log(level, msg);
    if(_next != null)
      _next.log(level, msg);
  }
  void write_message(String msg);
}

class ProgrammerLogger extends Logger {
  ProgrammerLogger(Set<Levels> _levels) : super(_levels);
  void write_message(String msg) => print("[Programmer]: $msg");
}

class TeamLeadLogger extends Logger {
  TeamLeadLogger(Set<Levels> _levels) : super(_levels);
  void write_message(String msg) => print("[TeamLead]: $msg");
}

class BossLogger
    extends Logger {
  BossLogger(Set<Levels> _levels) : super(_levels);
  void write_message(String msg) => print("[Boss]: $msg");
}

void main(){
  var defaultLogger = ProgrammerLogger(Set.from(Levels.values));
  var highLogger = TeamLeadLogger(Set.from([Levels.Debug, Levels.Error]));
  var topLogger = BossLogger(Set.from([Levels.Debug, Levels.Info]));

  defaultLogger.next = highLogger;
  highLogger.next = topLogger;

  defaultLogger.log(Levels.Info, "we got a little bug");
  defaultLogger.log(Levels.Debug, "bug fixed");
  defaultLogger.log(Levels.Error, "we got some troubles");
}