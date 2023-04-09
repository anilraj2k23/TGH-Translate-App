import 'package:flutter/cupertino.dart';
import 'package:translator_app/models/language_model.dart';

class SelectedLanguageProvider with ChangeNotifier {
  Language? _selectedInputLanguage;
  Language? _selectedOutPutLanguage;

  Language? get selectedInputLanguage => _selectedInputLanguage;
  Language? get selectedOutputLanguage => _selectedOutPutLanguage;

  void setInputLanguage(Language selected) {
    _selectedInputLanguage = selected;

    notifyListeners();
  }
void setOutputLanguage(Language selected){
    _selectedOutPutLanguage =selected;
    notifyListeners();
}


}
