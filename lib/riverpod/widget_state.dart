import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_notifier.dart';


class WidgetState extends ConsumerStatefulWidget {
  const WidgetState({super.key});

  @override
  ConsumerState<WidgetState> createState() => _WidgetStateState();
}

class _WidgetStateState extends ConsumerState<WidgetState> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userProvider.notifier).fetchUser(); // ✅ Use ref instead of context
    });
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Widget State Example',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 20),
              userState.when(
                failure: (error) => Text(
                  'Error: $error',
                  style: const TextStyle(color: Colors.red),
                ),
                success: (name,email,phone) => Text(
                  'User Name: $name',
                  style: const TextStyle(fontSize: 24),
                ),
                initial: () => const Text("Initial state"),
                loading: () => const CircularProgressIndicator(),

              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ref.read(userProvider.notifier).fetchUser(); // Re-fetch user
                },
                child: const Text('Refresh User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
