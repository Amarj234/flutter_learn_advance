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
  final counter = StateController<List>([1,2,2,3,4,5]);
  final counterMap = StateController<Map>({'a': 1, 'b': 2, 'c': 3});
  final counterInt = StateController<int>(0);

  counter.addListener((value) => print('Counter: $value'));
  counterInt.addListener((value) => print('Counter: $value'));
  counterMap.addListener((value) => print('Counter: $value'));

  counterInt.state++;// Increment the integer counter

  final updatedList = List<int>.from(counter.state);// Create a copy of the current list
  final updatedMap = Map.from(counterMap.state);// Create a copy of the current map

  updatedMap['d'] = 4; // Add a new key-value pair to the map
  counterMap.state = updatedMap; // Update the map state


  updatedList.add(10);
  counter.state = updatedList;

  updatedList.add(20);
  counter.state = updatedList;
}
