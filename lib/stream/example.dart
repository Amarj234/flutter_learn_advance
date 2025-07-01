import 'dart:async';
import 'package:rxdart/rxdart.dart';

class SearchBloc {
  final _queryController = BehaviorSubject<String>();
  Stream<String> get queryStream => _queryController.stream;

  Function(String) get changeQuery => _queryController.sink.add; //Dart snippet to play with function references

  Stream<List<String>> get resultsStream => queryStream
      .debounceTime(Duration(milliseconds: 300))
      .distinct()
      .asyncMap((query) => _fetchResults(query));

  Future<List<String>> _fetchResults(String query) async {
    // Simulated search
    await Future.delayed(Duration(milliseconds: 500));
    return ['Result for "$query" 1', 'Result for "$query" 2'];
  }

  void dispose() {
    _queryController.close();
  }
}

void main() async {
  final bloc = SearchBloc();

  bloc.resultsStream.listen((results) {
    print(results);
  });

  bloc.changeQuery('f');
  bloc.changeQuery('fl');
  bloc.changeQuery('flu');
  bloc.changeQuery('flut');
  bloc.changeQuery('flutt');
  bloc.changeQuery('flutte');
  bloc.changeQuery('flutter'); // only this triggers after debounce

  await Future.delayed(Duration(seconds: 2));
  bloc.dispose();
}
