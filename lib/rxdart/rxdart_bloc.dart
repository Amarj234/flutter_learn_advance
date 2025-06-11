//
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class RxdartBloc {
  final _querySubject = BehaviorSubject<String>();
  final _resultsSubject = BehaviorSubject<List<String>>();

  Stream<List<String>> get resultsStream => _resultsSubject.stream;

  // Simulated async search API
  Future<List<String>> _fakeSearchApi(String query) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (query.isEmpty) return [];
    return List.generate(5, (i) => "$query result ${i + 1}");
  }

  RxdartBloc() {
    _querySubject
        .distinct()
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap((query) => Stream.fromFuture(_fakeSearchApi(query)))
        .listen((results) => _resultsSubject.add(results));
  }

  void onQueryChanged(String query) {
    _querySubject.add(query);
  }

  void dispose() {
    _querySubject.close();
    _resultsSubject.close();
  }
}
