import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_more/bloc/blocCubit/bloc_cubit.dart';
import 'package:learn_more/bloc/blocCubit/equatable_state.dart';

class WidgetCheck extends StatelessWidget {
  const WidgetCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cubit Example")),
      body: BlocBuilder<BlocCubit, EquatableState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.items.isEmpty) {
            return Center(child: Text("No items loaded"));
          }
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.items[index]),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<BlocCubit>().loadData();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
