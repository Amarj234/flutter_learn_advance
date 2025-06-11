
// lib/main.dart
import 'package:flutter/material.dart';
import 'rxdart_bloc.dart';

class RxDartApp extends StatelessWidget {
  const RxDartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final RxdartBloc bloc = RxdartBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RxDart Search')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: bloc.onQueryChanged,
              decoration: const InputDecoration(
                hintText: 'Type to search...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            StreamBuilder<List<String>>(
              stream: bloc.resultsStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Start typing...');
                }

                final results = snapshot.data!;
                if (results.isEmpty) {
                  return const Text('No results found.');
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (_, index) {
                      return ListTile(title: Text(results[index]));
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
