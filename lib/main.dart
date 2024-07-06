import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Utils/Routes/routes.dart';
import 'package:weather_app/Utils/Routes/routes_name.dart';
import 'viewmodels/weather_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        initialRoute: RoutesName.homeScreen,
        onGenerateRoute: (initialRoute) => Routes.generateRoute(initialRoute),
      ),
    );
  }
}
/*
Imports: Necessary packages and components are imported.

package:flutter/material.dart: For Flutter's material design components.
package:provider/provider.dart: For state management using Provider.
package:weather_app/Utils/Routes/routes.dart: For custom route generation.
package:weather_app/Utils/Routes/routes_name.dart: For route names.
viewmodels/weather_viewmodel.dart: For the WeatherViewModel.
main Function: The entry point of the app.

runApp(const MyApp());: Runs the MyApp widget as the root of the application.
MyApp Class:

StatelessWidget: This widget does not have mutable state.
Constructor: Initializes the MyApp widget with a const constructor.
build Method: Constructs the widget tree.
ChangeNotifierProvider: Provides the WeatherViewModel to the widget tree.
create: Initializes an instance of WeatherViewModel.
MaterialApp: Sets up the Material design structure for the app.
debugShowCheckedModeBanner: Hides the debug banner.
title: Sets the app title.
initialRoute: Sets the initial route to the home screen.
onGenerateRoute: Uses a custom route generator to handle route changes.
*/