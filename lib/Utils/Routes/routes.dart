import 'package:flutter/material.dart';
import 'package:weather_app/Utils/Routes/routes_name.dart';
import 'package:weather_app/Views/weather_screen.dart';
import 'package:weather_app/views/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesName.weatherScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const WeatherDetailsScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Route Defined'),
            ),
          );
        });
    }
  }
}
//here all routes are used so that if a person want to add a new route then they don't have to change whole code