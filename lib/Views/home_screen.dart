import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Resources/Components/button.dart';
import 'package:weather_app/Resources/colors.dart';
import 'package:weather_app/Utils/Routes/routes_name.dart';
import 'package:weather_app/Utils/utils.dart';
import '../viewmodels/weather_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(
              color: AppColors.blackColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(146, 104, 101, 101),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(146, 104, 101, 101),
        ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  height: 500,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/cloud.webp'),
                          fit: BoxFit.fitHeight)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Enter city name',
                          fillColor: Colors.white,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          suffixIcon: RoundButton(
                            title: 'Get Weather',
                            onPress: () async {
                              final viewModel = Provider.of<WeatherViewModel>(
                                  context,
                                  listen: false);
                              await viewModel.fetchWeather(_controller.text);
                              Navigator.pushNamed(
                                  context, RoutesName.weatherScreen);
                              if (_controller.text.isEmpty ||
                                  viewModel.weather == null) {
                                Utils.toastmessage('Invalid Data');
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/* 
Imports: Necessary packages and components are imported.
HomeScreen Class:
TextEditingController: Used to control the input text field.
Constructor: Initializes the HomeScreen widget.
build Method: Constructs the widget tree.
AppBar: A title bar with a centered title.
Container: The main container that takes the full width and height of the screen.
Decoration: Sets the background color.
Center Widget: Centers its child.
SingleChildScrollView: Allows vertical scrolling.
Column: Arranges its children vertically.
Container: Contains the image and the text field.
Decoration: Adds the background image.
Padding: Adds padding around the text field.
TextField: The input field for entering the city name.
Decoration: Sets the hint text, fill color, border, and a custom suffix icon.
RoundButton: A custom button that, when pressed, fetches the weather data and navigates to the weather screen.
onPress:
Fetches weather data using WeatherViewModel.
Navigates to the weather screen if the input is valid.
Shows a toast message if the input is invalid or if no weather data is found.
*/