// lib/mobx/user_store.dart
import 'package:mobx/mobx.dart';

// Run: dart run build_runner build --delete-conflicting-outputs
// to (re)generate the user_store.g.dart part file below.
part 'user_store.g.dart';

enum UserStatus { initial, loading, success, error }

// lib/models/user.dart
class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}

// `UserStore` is the public class; `_UserStore` holds the reactive members.
class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // @observable marks state that MobX tracks. Any @observer widget that reads
  // one of these rebuilds automatically when the value changes.
  @observable
  User? user;

  @observable
  UserStatus status = UserStatus.initial;

  @observable
  String errorMessage = '';

  // @computed derives a value from observables and caches it until they change.
  @computed
  bool get isLoading => status == UserStatus.loading;

  // @action groups mutations into a single transaction so observers are only
  // notified once, after the action finishes.
  @action
  Future<void> fetchUser() async {
    status = UserStatus.loading;
    errorMessage = '';

    try {
      // Simulated API response.
      await Future.delayed(const Duration(seconds: 2));
      user = User(name: 'Amarjeet', age: 25);
      status = UserStatus.success;
    } catch (e) {
      errorMessage = 'Failed to load user';
      status = UserStatus.error;
    }
  }
}
