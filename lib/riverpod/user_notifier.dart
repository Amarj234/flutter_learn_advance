import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(const UserState.initial());

  Future<void> fetchUser() async {
    state = const UserState.loading();

    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));
      // Simulate success response
      state = const UserState.success(name: "Amarjeet");
    } catch (e) {
      state = UserState.failure("Failed to load user");
    }
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>(
      (ref) => UserNotifier(),
);
