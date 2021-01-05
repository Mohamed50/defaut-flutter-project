import '../resources/pref-manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  PrefManager _prefManager = PrefManager();

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }

  ThemeData _theme;

  ThemeData get theme => _theme;

  set theme(ThemeData themeData) {
    _theme = themeData;
    notifyListeners();
  }

  init() {
    String preferredTheme = _prefManager.getString("theme") ?? "light";
    if (preferredTheme == "light") {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
  }

  toDark() async {
    await _prefManager.setString("theme", "dark");
    themeMode = ThemeMode.dark;
  }

  toLight() async {
    await _prefManager.setString("theme", "light");
    themeMode = ThemeMode.light;
  }

  isDark() {
    return themeMode == ThemeMode.dark;
  }

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue[700],
    primaryColor: Colors.blue[700],
    accentColor: Colors.blueAccent,
    fontFamily: "ar",
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Color(0xFFF5F5F5),
    appBarTheme: AppBarTheme(
      color: Colors.blue[700],
      textTheme: TextTheme(headline6: TextStyle(color: Colors.grey[900])),
    ),
    iconTheme: IconThemeData(color: Colors.grey[900]),
    cardColor: Colors.grey[100],
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.grey[900], fontSize: 22),
      headline5: TextStyle(color: Colors.grey[900], fontSize: 20),
      headline4: TextStyle(color: Colors.grey[900], fontSize: 18),
      headline3: TextStyle(color: Colors.grey[900], fontSize: 16),
      headline2: TextStyle(color: Colors.grey[900], fontSize: 14),
      headline1: TextStyle(color: Colors.grey[900], fontSize: 10),
      bodyText1: TextStyle(color: Colors.grey[900], fontSize: 8),
      bodyText2: TextStyle(color: Colors.grey[700], fontSize: 8),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue[700],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.blue[700],
      primaryColor: Colors.blue[700],
      accentColor: Colors.blueAccent,
      fontFamily: "ar",
      backgroundColor: Colors.grey[900],
      scaffoldBackgroundColor: Colors.black.withOpacity(0.8),
      cardColor: Colors.black.withOpacity(0.8),
      appBarTheme: AppBarTheme(
          color: Colors.black.withOpacity(0.8),
          textTheme: TextTheme(headline6: TextStyle(color: Colors.grey[900]))),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.white, fontSize: 22),
        headline5: TextStyle(color: Colors.white, fontSize: 20),
        headline4: TextStyle(color: Colors.white, fontSize: 18),
        headline3: TextStyle(color: Colors.white, fontSize: 16),
        headline2: TextStyle(color: Colors.white, fontSize: 14),
        headline1: TextStyle(color: Colors.white, fontSize: 10),
        bodyText1: TextStyle(color: Colors.white, fontSize: 8),
        bodyText2: TextStyle(color: Colors.grey[300], fontSize: 8),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue[700],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ));
}
