import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Resources/colors.dart';
import '../viewmodels/weather_viewmodel.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WeatherViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(146, 104, 101, 101),
        title: const Text(
          'Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              await viewModel.loadLastSearchedCity();
            },
          ),
        ],
      ),
      body: Center(
        child: Consumer<WeatherViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.weather == null) {
              return const CircularProgressIndicator();
            } else {
              return Container(
                height: double.infinity,
                width: double.infinity,
                color: const Color.fromARGB(146, 104, 101, 101),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      viewModel.weather!.cityName,
                      style: const TextStyle(
                          fontSize: 24,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Image.network(
                      'http://openweathermap.org/img/wn/${viewModel.weather!.icon}@4x.png',
                    ),
                    SizedBox(
                      width: 500,
                      height: 500,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Temperature: ${viewModel.weather!.temperature}°C',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: AppColors.blackColor),
                                ),
                                Text(
                                  'Condition: ${viewModel.weather!.description}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: AppColors.blackColor),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Humidity: ${viewModel.weather!.humidity}%',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: AppColors.blackColor),
                                ),
                                Text(
                                  'Wind Speed: ${viewModel.weather!.windSpeed} m/s',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: AppColors.blackColor),
                                ),
                              ],
                            )
                          ]),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
/*
Imports: Necessary packages and components are imported.
WeatherDetailsScreen Class:
StatelessWidget: This widget does not have mutable state.
build Method: Constructs the widget tree.
ViewModel: Obtains the WeatherViewModel instance from the Provider.
Scaffold: Provides a basic material design layout structure.
AppBar: Contains the title and a refresh button.
IconButton: Allows the user to refresh the weather data by calling viewModel.loadLastSearchedCity().
Center Widget: Centers its child.
Consumer: Listens for changes in the WeatherViewModel.
builder: A function that builds the widget tree based on the current state of the viewModel.
CircularProgressIndicator: Displays a loading spinner if viewModel.weather is null.
Container: Displays the weather details if viewModel.weather is not null.
Column: Arranges its children vertically.
Text: Displays the city name.
Image.network: Displays the weather icon.
Column: Displays temperature and condition.
Column: Displays humidity and wind speed.
*/