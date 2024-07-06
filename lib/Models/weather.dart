class Weather {
  final String cityName;
  final String description;
  final double temperature;
  final int humidity;
  final double windSpeed;
  final String icon;

  Weather({
    required this.cityName,
    required this.description,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      icon: json['weather'][0]['icon'],
    );
  }
}
/* 
1.Class Properties: cityName, description, temperature, humidity, windSpeed, and icon are defined as final properties, meaning they cannot be modified after the object is created.
2.Constructor: The constructor requires all properties to be passed when a new Weather object is instantiated.
3. Factory Constructor (fromJson): This is a special constructor that creates an instance of Weather from a JSON object. It extracts relevant data from the JSON structure and initializes a Weather object with it. This is particularly useful for dealing with API responses that are in JSON format.
*/