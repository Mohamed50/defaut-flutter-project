import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'provider/auth-provider.dart';
import 'provider/language-provider.dart';
import 'provider/theme-provider.dart';
import 'utils/routes.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'view/auth/auth-widget-builder.dart';

class MyApp extends StatelessWidget {
  final GlobalKey appKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Phoenix(
      child: ChangeNotifierProvider<AuthProvider>(
        create: (context) => AuthProvider(),
        lazy: false,
        child: AuthWidgetBuilder(
          builder: (BuildContext context, AuthEvent authEvent) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider<LanguageProvider>(
                  create: (context) => LanguageProvider(),
                  lazy: false,
                ),
                ChangeNotifierProvider<ThemeProvider>(
                  create: (context) => ThemeProvider(),
                  lazy: false,
                ),
              ],
              child: Selector<ThemeProvider,ThemeMode>(
                selector: (_, provider) => provider.themeMode,
                builder: (context, value, child) => Selector<LanguageProvider,Locale>(
                  selector: (context, provider) => provider.locale,
                  builder: (context, locale, child) =>  MaterialApp(
                    key: appKey,
                    debugShowCheckedModeBanner: false,
                    title: Provider.of<LanguageProvider>(context,listen:false).translate("App Name"),
                    locale: locale,
                    localizationsDelegates: [
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    supportedLocales: Provider.of<LanguageProvider>(context,listen: false).supportedLocales,
                    theme: ThemeProvider.lightTheme,
                    darkTheme: ThemeProvider.darkTheme,
                    themeMode: Provider.of<ThemeProvider>(context).themeMode,
                    onGenerateRoute: onRouteChanges,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
