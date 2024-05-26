import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String language = 'en';

  void changeLanguage(String selectedLanguage) {
    if (language == selectedLanguage) {
      return;
    }
    language = selectedLanguage;
    notifyListeners();
  }
}
