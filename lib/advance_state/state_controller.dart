class StateController<T> {
  T _state;
  final List<void Function(T)> _listeners = [];

  StateController(this._state);

  T get state => _state;

  set state(T value) {
    _state = value;
    _notify();
  }

  void _notify() {
    for (var listener in _listeners) {
      listener(_state);
    }
  }

  void addListener(void Function(T) listener) => _listeners.add(listener);

  void removeListener(void Function(T) listener) => _listeners.remove(listener);
}




void main() {
  final counter = StateController<int>(0);

  counter.addListener((value) => print('Counter: $value'));
  counter.state++;
}
