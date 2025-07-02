import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_more/other/dependencyInjection/dependency_injection.dart';




void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final getIt = GetIt.instance;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(title: Text('GetIt Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            viewModel.loadData();
          },
          child: Text('Load Data'),
        ),
      ),
    );
  }
}

class ApiService {
  void fetchData() {
    print("Fetching data from API...");
  }
}

class HomeViewModel {
  final ApiService apiService;

  HomeViewModel(this.apiService);

  void loadData() {
    apiService.fetchData();
  }
}
