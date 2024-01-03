import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routesName.dart';
import 'package:mvvm/view/homeScreen.dart';
import 'package:mvvm/view/loginScreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text("No route defined"),
                  ),
                ));
    }
  }
}
