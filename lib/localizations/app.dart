import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../generated/app_localizations.dart';


void main() {
  runApp(MyWidgets());
}

class MyWidgets extends StatefulWidget {
  const MyWidgets({super.key});

  @override
  State<MyWidgets> createState() => _MyWidgetsState();
}

class _MyWidgetsState extends State<MyWidgets> {
  Locale _locale = const Locale('en'); // default language

  void _changeLanguage(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localization Demo',
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
      ],
      home: MyHomePage(onLocaleChange: _changeLanguage),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  const MyHomePage({super.key, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.hello),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'en') {
                onLocaleChange(const Locale('en'));
              } else if (value == 'hi') {
                onLocaleChange(const Locale('hi'));
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'en', child: Text("Change English" + " 🇬🇧")),
              PopupMenuItem(value: 'hi', child: Text("बदलें हिन्दी" + " 🇮🇳")),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(loc.welcome, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 16),
              Text(loc.goodMorning, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: Text(loc.logout.toString()),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(loc.logout),
                      content: Text(loc.confirmLogout),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Your logout logic
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
