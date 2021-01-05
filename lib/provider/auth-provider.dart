import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../utils/dialog_utils.dart';
import '../resources/pref-manager.dart';
import 'package:dio/dio.dart';

enum AuthEvent { Authenticated, Skip, NotAuthenticated, Blocked }
enum AuthPage { Login, Register }

class AuthProvider with ChangeNotifier {
  // Repository _repository = Repository();
  PrefManager _prefManager = PrefManager();

  AuthEvent _authEvent = AuthEvent.NotAuthenticated;
  get authEvent => _authEvent;
  set authEvent(AuthEvent event) {
    _authEvent = event;
    notifyListeners();
  }

  init() async {
  }

  // Future logout(BuildContext context) async {
  //   await _prefManager.clear();
  //   await _repository.clear();
  //   try{
  //     await FacebookLogin().logOut();
  //     await GoogleSignIn().signOut();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   Phoenix.rebirth(context);
  // }
  //
  // Future signIn(context, String phone, String password) async {
  //   showLoadingDialog(context);
  //   Response response = await _repository.signIn(phone, password);
  //   Navigator.of(context).pop();
  //   handleResponse(
  //     response: response,
  //     onSuccess: () async {
  //       _prefManager.setString("cmsToken", response.data["jwt"]);
  //       profile = Profile.fromJson(response.data["user"]);
  //       Navigator.of(context)
  //           .pushNamedAndRemoveUntil(splashRoute, (route) => true);
  //       Provider.of<MenuProvider>(context, listen: false).selectedIndex = 0;
  //       init();
  //       authEvent = AuthEvent.Authenticated;
  //     },
  //     onError: () async {
  //       await showMessageDialog(context, getMessage(response.data));
  //     },
  //   );
  // }
  //
  // Future signUp(
  //     context, String phone, String email, String name, String password) async {
  //   showLoadingDialog(context);
  //   Response response = await _repository.signUp(phone, email, name, password);
  //   Navigator.of(context).pop();
  //   handleResponse(
  //     response: response,
  //     onSuccess: () async {
  //       await showMessageDialog(context, "Account created");
  //       _prefManager.setString("cmsToken", response.data["jwt"]);
  //       profile = Profile.fromJson(response.data["user"]);
  //       Navigator.of(context)
  //           .pushNamedAndRemoveUntil(splashRoute, (route) => true);
  //       Provider.of<MenuProvider>(context, listen: false).selectedIndex = 0;
  //       init();
  //       authEvent = AuthEvent.Authenticated;
  //     },
  //     onError: () async {
  //       await showMessageDialog(
  //           context, response.data["message"][0]["messages"][0]["message"] ?? "Something went wrong");
  //     },
  //   );
  // }
  //
  // handleSocialSignIn(BuildContext context, Response response) {
  //   handleResponse(
  //     response: response,
  //     onSuccess: () async {
  //       _prefManager.setString("cmsToken", response.data["jwt"]);
  //       profile = Profile.fromJson(response.data["user"]);
  //       Navigator.of(context)
  //           .pushNamedAndRemoveUntil(splashRoute, (route) => false);
  //       Provider.of<MenuProvider>(context, listen: false).selectedIndex = 0;
  //       init();
  //       authEvent = AuthEvent.Authenticated;
  //       Phoenix.rebirth(context);
  //     },
  //     onError: () async {
  //       await showMessageDialog(context, getMessage(response.data));
  //     },
  //   );
  // }


  isAuthenticated() {
    return authEvent == AuthEvent.Authenticated;
  }

}
