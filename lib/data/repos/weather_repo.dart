// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/utilities/constants.dart';

class WeatherRepo {
  Future<WeatherResponse> weatherRepo({required String city}) async {
    final response = await http.get(
      Uri.parse(
         '${Constants.base_api}data/2.5/weather?q=$city&appid=cdd4b5e4f0e4e2231d2b92c74eae003f'),
    );
    var data = jsonDecode(response.body);
    print(data.toString());
    return WeatherResponse.fromJson(data);
 
  }
}
