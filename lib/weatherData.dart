import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/weatherModel.dart';

class WeatherData {
  Future<WeatherModel> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=fd50b223cc3b475d8e075358222611&q=$latitude,$longitude&aqi=no');

    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);

    return WeatherModel.fromJson(body);
  }
}
