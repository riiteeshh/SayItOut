import 'package:flutter/material.dart';
import 'package:talkitout/pages/home_page.dart';
import 'package:talkitout/pages/login_page.dart';
import 'package:talkitout/pages/main_layout_page.dart';
import 'package:talkitout/pages/signup_page.dart';

class RouteManager {
  static const String loginPage = '/';
  static const String signUpPage = '/signUpPage';
  static const String homePage = '/homePage';
  static const String mainLayoutPage = '/mainLayoutPage';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case signUpPage:
        return MaterialPageRoute(builder: (context) => const SignUpPage());
      case homePage:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case mainLayoutPage:
        return MaterialPageRoute(builder: (context) => const MainLayoutPage());
      default:
        throw const FormatException('Route not found!');
    }
  }
}
