import 'package:flutter/material.dart';
import 'package:talkitout/pages/login_page.dart';
import 'package:talkitout/pages/signup_page.dart';

class RouteManager {
  static const String loginPage = '/';
  static const String signUpPage = '/signUpPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case signUpPage:
        return MaterialPageRoute(builder: (context) => const SignUpPage());
      default:
        throw const FormatException('Route not found!');
    }
  }
}
