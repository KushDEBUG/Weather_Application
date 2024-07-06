import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/weather.dart';
import '../services/api_service.dart';

class WeatherViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  Weather? _weather;
  String? _lastSearchedCity;
  bool _isRefreshing = false;

  Weather? get weather => _weather;
  String? get lastSearchedCity => _lastSearchedCity;
  bool get isRefreshing => _isRefreshing;

  WeatherViewModel() {
    loadLastSearchedCity();
  }
  Future<void> fetchWeather(String city) async {
    try {
      _weather = await _apiService.fetchWeather(city);
      _saveLastSearchedCity(city);
      notifyListeners();
    } catch (e) {
      Exception(e);
    }
  }

  Future<void> _saveLastSearchedCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lastSearchedCity', city);
  }

  Future<void> loadLastSearchedCity() async {
    final prefs = await SharedPreferences.getInstance();
    _lastSearchedCity = prefs.getString('lastSearchedCity');
    if (_lastSearchedCity != null) {
      await fetchWeather(_lastSearchedCity!);
    }
  }

  Future<void> refreshWeather() async {
    if (_lastSearchedCity != null) {
      _isRefreshing = true;
      notifyListeners();
      try {
        await fetchWeather(_lastSearchedCity!);
      } catch (e) {
        // Handle error if needed
      }
      _isRefreshing = false;
      notifyListeners();
    }
  }
}
/* 
Imports: Required packages and dependencies are imported.
WeatherViewModel Class:
Properties:
_weather: Stores the current weather data.
_lastSearchedCity: Stores the last searched city's name.
_isRefreshing: Indicates whether the data is being refreshed.
Getters: Publicly expose the private properties.
Constructor: Initializes the ViewModel and loads the last searched city.
fetchWeather: Fetches weather data for a given city and saves it to _weather. Also updates the last searched city.
_saveLastSearchedCity: Saves the last searched city to SharedPreferences.
loadLastSearchedCity: Loads the last searched city from SharedPreferences and fetches its weather data.
refreshWeather: Refreshes the weather data for the last searched city, updating the _isRefreshing state accordingly.
This structure ensures the ViewModel handles data fetching, state management, and persistence using SharedPreferences effectively.
*/