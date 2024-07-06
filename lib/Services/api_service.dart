import 'package:http/http.dart' as http;
import 'package:weather_app/Resources/Components/appurl.dart';
import 'dart:convert';
import '../models/weather.dart';

class ApiService {
  Future<Weather> fetchWeather(String city) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$weather_api_url_key&units=metric'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());
      return Weather.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
//Fetching weather api and check if the statuscode is 200 then return the data, otherwise handle the error through exception 