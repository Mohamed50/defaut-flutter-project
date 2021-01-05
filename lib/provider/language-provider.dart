import 'dart:convert';
import '../resources/pref-manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LanguageProvider with ChangeNotifier{

  List<String> _supportedLanguages = ['ar','en'];
  List<String> _supportedLanguagesNames = ['العربية','English'];
  List<String> get supportedLanguages => _supportedLanguages;
  List<String> get supportedLanguagesNames => _supportedLanguagesNames;

  List<Locale> _supportedLocales;
  List<Locale> get supportedLocales => _supportedLocales;
  set supportedLocales (Iterable<Locale> locales){
    _supportedLocales = locales;
    notifyListeners();
  }

  Map _localizedValues;
  Map get localizedValues => _localizedValues;
  set localizedValues(Map map){
    _localizedValues = map;
    notifyListeners();
  }

  Locale _locale = Locale("en");
  Locale get locale => _locale;
  set locale(Locale value){
    _locale = value;
    notifyListeners();
  }

  get currentLanguageName {
    if(_locale == null)
      return 'English';
    else
      return _locale.languageCode == "en" ? "English" : "العربية";
  }

  LanguageProvider(){
    supportedLocales = _supportedLanguages.map(
            (supportedLanguage) {
          return new Locale(supportedLanguage);
        }).toList();
    init();
  }

  init() async {
    String lang = await getPreferredLanguage();
    locale = Locale(lang);
    getLocalized();
  }

  getPreferredLanguage(){
    return PrefManager().get('language',supportedLanguages[0]);
  }

  setPreferredLanguage(String lang){
    return PrefManager().set('language', lang);
  }

  changeLanguage(String lang) async {
    locale = Locale(lang);
    setPreferredLanguage(lang);
    getLocalized();
  }

  getLocalized() async {
    String jsonContent = await rootBundle.loadString("locale/i18n_${_locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
  }

  Future switchLanguage() async{
    if (locale.languageCode == "en") {
      await changeLanguage("ar");
    } else {
      await changeLanguage("en");
    }
  }

  String translate(String key) {
    if(_localizedValues == null || _localizedValues[key] == null){
      return key;
    }
    else{
      return _localizedValues[key];
    }
  }

  bool isRtl(){
    return _locale.languageCode == "ar";
  }

  rightBorderRadiusBasedOnLanguageDirection(double value){
    return BorderRadius.horizontal(right: isRtl() ? Radius.circular(0) : Radius.circular(value), left: isRtl() ? Radius.circular(value) : Radius.circular(0));
  }

  leftBorderRadiusBasedOnLanguageDirection(double value){
    return BorderRadius.horizontal(right: isRtl() ? Radius.circular(value) : Radius.circular(0), left: isRtl() ? Radius.circular(0) : Radius.circular(value));
  }

  getFontSize(double size){
    return isRtl() ? size - 2 : size;
  }
}
