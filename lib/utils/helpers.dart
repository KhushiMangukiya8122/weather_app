import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class APIHelper {
  APIHelper._(); //private named constructor
  static final APIHelper apiHelper = APIHelper._();

  Future<WeatherModel?> fetchweather({required String locationame}) async {
    String baseurl =
        "http://api.weatherapi.com/v1/forecast.json?key=81ae12730ab141439e8125321232205&q=$locationame&aqi=no";

    http.Response res = await http.get(Uri.parse(baseurl));

    if (res.statusCode == 200) {
      String data = res.body;
      Map<String, dynamic> decoddata = jsonDecode(data);
      WeatherModel weatherdata = WeatherModel.frommap(data: decoddata);
      return weatherdata;
    }
  }
}
