// lib/controllers/user_controller.dart
import 'package:get/get.dart';


enum UserStatus { initial, loading, success, error }

class UserController extends GetxController {
  var user = Rxn<User>();
  var status = UserStatus.initial.obs;
  var errorMessage = ''.obs;

  void fetchUser() async {
    status.value = UserStatus.loading;
    await Future.delayed(const Duration(seconds: 2));

    try {
      // Simulated API response
      user.value = User(name: 'Amarjeet', age: 25);
      status.value = UserStatus.success;
    } catch (e) {
      errorMessage.value = 'Failed to load user';
      status.value = UserStatus.error;
    }
  }
}

// lib/models/user.dart
class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}

