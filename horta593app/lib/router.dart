import 'package:flutter/material.dart';
import 'package:horta593app/screens/login/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => LoginScreen());
    case LoginScreen.routeName:
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                  body: Center(
                child: Text("Pagina no encontrada."),
              )));
  }
}
