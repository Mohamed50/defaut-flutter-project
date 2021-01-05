import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saydek/provider/auth-provider.dart';
import 'package:saydek/view/auth/login.dart';
import 'package:saydek/view/static/home.dart';

class AuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<AuthProvider, bool>(
      selector: (context, authProvider) => authProvider.isAuthenticated(),
      builder: (BuildContext context, bool authenticated, Widget child) {
        return MultiProvider(providers: [
        ], child: authenticated ? HomePage()
            : LoginPage(),
        );
      },
    );
  }
}