import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:saydek/view/splash.dart';


const String splashRoute = '/';
const String authRoute = '/auth';
const String loginRoute = '/login';
const String registerRoute = '/register';
const String verifyRoute = '/verify';
const String forgetPasswordRoute = '/forget-password';
const String homeRoute = '/home';


Route<dynamic> onRouteChanges (RouteSettings settings) {
  switch (settings.name) {
    case splashRoute:
      return PageTransition(child: SplashPage(), type: PageTransitionType.fade,duration: Duration(seconds: 1),curve: Curves.bounceIn);
      break;
    default:
      return null;
  }
}
