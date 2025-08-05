// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get hello => 'नमस्ते';

  @override
  String get welcome => 'ऐप में आपका स्वागत है';

  @override
  String get goodMorning => 'सुप्रभात';

  @override
  String get changeLanguage => 'भाषा बदलें हिन्दी';

  @override
  String get selectLanguage => 'एक भाषा चुनें';

  @override
  String get logout => 'लॉग आउट';

  @override
  String get confirmLogout => 'क्या आप वाकई लॉग आउट करना चाहते हैं?';
}
