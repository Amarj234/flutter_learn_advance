import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'simple_item.dart';

/// A notifier that doesn't use any code generation.
/// Shows how to manage complex async state manually with standard classes.
class SimpleItemNotifier extends AsyncNotifier<List<SimpleItem>> {
  
  @override
  FutureOr<List<SimpleItem>> build() async {
    // Initial data fetch
    return _fetchInitialData();
  }

  Future<List<SimpleItem>> _fetchInitialData() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      const SimpleItem(id: '1', title: 'Learn Riverpod essentials'),
      const SimpleItem(id: '2', title: 'Avoid code generation when needed'),
      const SimpleItem(id: '3', title: 'Master manual immutable state'),
    ];
  }

  /// Toggle completion state
  Future<void> toggle(String id) async {
    // We can use [state.whenData] to perform optimistic updates or simple transformations
    state = await AsyncValue.guard(() async {
      final items = state.valueOrNull ?? [];
      return items.map((item) {
        if (item.id == id) {
          return item.copyWith(isDone: !item.isDone);
        }
        return item;
      }).toList();
    });
  }

  /// Add a new item
  Future<void> addItem(String title) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final currentItems = state.valueOrNull ?? [];
      final newItem = SimpleItem(
        id: DateTime.now().toString(),
        title: title,
      );
      // Wait to simulate network
      await Future.delayed(const Duration(milliseconds: 500));
      return [...currentItems, newItem];
    });
  }
}

/// The provider for our non-freezed notifier
final simpleItemProvider = AsyncNotifierProvider<SimpleItemNotifier, List<SimpleItem>>(
  () => SimpleItemNotifier(),
);
