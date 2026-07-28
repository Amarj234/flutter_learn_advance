import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'user_store.dart';

class MobxWidget extends StatefulWidget {
  const MobxWidget({super.key});

  @override
  State<MobxWidget> createState() => _MobxWidgetState();
}

class _MobxWidgetState extends State<MobxWidget> {
  // Create the store once for the lifetime of this widget.
  final UserStore store = UserStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MobX Example')),

      // `Observer` from flutter_mobx rebuilds only this subtree whenever an
      // observable it reads (status/user/errorMessage) changes.
      body: Center(
        child: Observer(
          builder: (_) {
            switch (store.status) {
              case UserStatus.initial:
                return const Text('Click the button to load user.');
              case UserStatus.loading:
                return const CircularProgressIndicator();
              case UserStatus.success:
                return Text(
                  'Hello, ${store.user?.name}, Age: ${store.user?.age}',
                );
              case UserStatus.error:
                return Text(
                  store.errorMessage,
                  style: const TextStyle(color: Colors.red),
                );
            }
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: store.fetchUser,
        child: const Icon(Icons.download),
      ),
    );
  }
}
