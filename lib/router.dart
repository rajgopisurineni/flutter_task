import 'package:flutter/material.dart';
import 'package:flutter_task/routes.dart';
import 'package:flutter_task/screens/home_page.dart';
import 'package:flutter_task/screens/login_page.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  /// Here we'll handle all the routing
  switch (settings.name) {
    case Routes.loginPage:
      return MaterialPageRoute(builder: (_) => const LoginPage());
    case Routes.homePage:
      return MaterialPageRoute(builder: (_) => const HomePage());
    default :
      return MaterialPageRoute(builder: (_) => const LoginPage());
  }
}
