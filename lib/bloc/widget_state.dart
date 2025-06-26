import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_more/bloc/bloc.dart';

class WidgetState extends StatefulWidget {
  const WidgetState({super.key});

  @override
  State<WidgetState> createState() => _WidgetStateState();
}

class _WidgetStateState extends State<WidgetState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BlocMain, BlocStateClass>(
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading ||
              previous.items != current.items,
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                Expanded( // ✅ this gives ListView a bounded height
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(state.items[i]),
                        onTap: () {
                          // Handle item tap
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
