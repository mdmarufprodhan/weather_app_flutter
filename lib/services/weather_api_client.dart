import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/weather_model.dart';

class WeatherApiClients{

  Future<Weather>? getCurrentWeather(String? location) async {
    var endpint  = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=4ab226d8e3a47e57319ff1c3cc3d5f0a&units=metric");

    var response  =await http.get(endpint);
    var body  = jsonDecode(response.body);
    Weather weather = Weather.fromJson(body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);

  }
}
