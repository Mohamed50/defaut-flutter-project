import '../../provider/auth-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWidgetBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, AuthEvent authEvent) builder;

  const AuthWidgetBuilder({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<AuthProvider,AuthEvent>(
      selector: (_, provider) => provider.authEvent,
      builder: (BuildContext context, authEvent, Widget child) {
        print("Rebuild");
        return builder(context, authEvent);
      },
    );
  }
}
