import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_more/bloc/bloc_main.dart';
import 'package:learn_more/bloc/bloc_event.dart';
import 'package:learn_more/bloc/bloc_state.dart';
import 'package:learn_more/bloc/widget_state.dart' as custom_widget;


void main() {
  test('BlocMain emits loading then loaded state on Load event', () async {
    final bloc = BlocMain();

    // Initial state check
    expect(bloc.state, BlocStateClass.initial());

    // Listen to state changes
    final emittedStates = <BlocStateClass>[];
    final subscription = bloc.stream.listen(emittedStates.add);

    // Add Load event
    bloc.add(Load());

    // Wait for state changes (longer than 2 seconds delay in your Bloc)
    await Future.delayed(const Duration(seconds: 3));

    // Cancel the listener
    await subscription.cancel();

    // Assert the expected sequence of states
    expect(emittedStates.length, 2);

    expect(emittedStates[0], BlocStateClass(
      items: [],
      isLoading: true,
      errorMessage: '',
    ));

    expect(emittedStates[1], BlocStateClass(
      items: ['Item 1', 'Item 2', 'Item 3'],
      isLoading: false,
      errorMessage: '',
    ));
  });
  testWidgets('WidgetState shows loading and then list of items',
      (WidgetTester tester) async {
    final bloc = BlocMain();

    // Wrap your widget with the real BlocProvider
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: bloc,
          child: custom_widget.WidgetState(),
        ),
      ),
    );

    // Trigger loading
    bloc.add(Load());

    // Let the bloc emit loading state
    await tester.pump(); // Triggers rebuild with isLoading = true
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for delayed emit (2 seconds from your bloc logic)
    await tester.pump(const Duration(seconds: 3)); // Allow delayed emit
    await tester.pump(); // Trigger UI update

    // Validate that CircularProgressIndicator is gone
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Validate that list items are shown
    expect(find.byType(ListTile), findsNWidgets(3));
    expect(find.text('Item 1'), findsOneWidget);
    expect(find.text('Item 2'), findsOneWidget);
    expect(find.text('Item 3'), findsOneWidget);
  });


 testWidgets('golden test with real BlocMain in loaded state', (WidgetTester tester) async {
    // Use real BlocMain
    final bloc = BlocMain();

    // Emit loaded state manually
    bloc.emit(BlocStateClass(
      isLoading: false,
      items: ['Alpha', 'Beta', 'Gamma'],
      errorMessage: '',
    ));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<BlocMain>.value(
          value: bloc,
          child:  custom_widget.WidgetState(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Golden comparison
    await expectLater(
      find.byType(WidgetState),
      matchesGoldenFile('goldenImage/widget_state_loaded.png'),
    );
  });
  

}
