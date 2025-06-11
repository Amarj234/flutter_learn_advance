
class Event {}

class EventBus {
  final _listeners = <Type, List<Function>>{};

  void on<T extends Event>(void Function(T) handler) {
    _listeners[T] ??= [];
    _listeners[T]!.add(handler);
  }

  void emit<T extends Event>(T event) {
    for (final handler in _listeners[T.runtimeType] ?? []) {
      handler(event);
    }
  }
}


final bus = EventBus();

void main() {
  bus.on<UserLoggedIn>((event) {
    print('User logged in: ${event.username}');
  });

  bus.emit(UserLoggedIn('amarjeet'));
}





class UserLoggedIn extends Event {
  final String username;
  UserLoggedIn(this.username);
}
