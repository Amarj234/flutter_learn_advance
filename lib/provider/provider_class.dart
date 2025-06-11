import 'package:flutter/material.dart';
import 'provider_state.dart';

class ProviderClass extends ChangeNotifier {
  ProviderState _state = const ProviderState.initial();

  ProviderState get state => _state;

  Future<void> fetchUser() async {
    _state = const ProviderState.loading();
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));
      _state = const ProviderState.success(name: 'Amarjeet');

    } catch (e) {
      _state = ProviderState.failure('Failed to load user');
    }

    notifyListeners();
  }
}
