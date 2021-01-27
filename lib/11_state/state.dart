abstract class WeatherState{
  void _showAction();
}

class WeatherInitial implements WeatherState{
  void _showAction() {
    print("Initialized");
  }
}

class WeatherLoadInProgress implements WeatherState{
  void _showAction() {
    print("Loading");
  }
}

class WeatherLoadSuccess implements WeatherState{
  void _showAction() {
    print("Weather successfully loaded");
  }
}

class WeatherLoadFailure implements WeatherState{
  void _showAction() {
    print("Weather didn't loaded");
  }
}

class StateManager {
  WeatherState _state;

  void setCurrentState(WeatherState state) {
    this._state = state;
  }
  void printAction() {
    _state._showAction();
  }

  void workExample() {
    if (_state is WeatherInitial) {
      printAction();
      setCurrentState(WeatherLoadInProgress());
      printAction();
      setCurrentState(WeatherLoadSuccess());
      printAction();
    }
    else {
      setCurrentState(WeatherLoadFailure());
      printAction();
    }
  }


}

void main(){
  WeatherState state = WeatherInitial();
  // WeatherState state = WeatherLoadSuccess();
  StateManager manager = StateManager();
  manager.setCurrentState(state);
  manager.workExample();
}