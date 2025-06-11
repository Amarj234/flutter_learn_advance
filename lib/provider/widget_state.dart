import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learn_more/provider/provider_class.dart';

class WidgetState extends StatefulWidget {
  const WidgetState({super.key});

  @override
  State<WidgetState> createState() => _WidgetStateState();
}

class _WidgetStateState extends State<WidgetState> {

  @override
  Widget build(BuildContext context) {
  //  final state = context.watch<ProviderClass>().state;
    return Scaffold(
      body: SafeArea(
        child: Center(

          //we can also use   BuildProvider<UserProvider>(
          child: Consumer<ProviderClass>(
            builder: (context, provider, child) {
              final state = provider.state;
              return state.when(
                failure: (error) => Text(
                  'Error: $error',
                  style: const TextStyle(color: Colors.red),
                ),
                success: (name,email,phone) => Text(
                  'User Name: $name',
                  style: const TextStyle(fontSize: 24),
                ),
                initial: () => const Text("Initial"),
                loading: () => const CircularProgressIndicator(),

              );
            },
          )
          ,
        ),
      ),
    );
  }
}
