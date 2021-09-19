import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:liveweather/model/weather_model.dart';

class WeatherRepo {
  Future<WeatherModel?> getWeather(String city) async {
    final result = await http.Client().get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=7450ce410bf286fc6849370007b1dc05"));
    print('here');
    if (result.statusCode != 200) {
      throw Exception();
    }
    return parsedJson(result.body);
  } 
 
  parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded["main"];
    return WeatherModel.fromJson(jsonWeather);
  }
}
