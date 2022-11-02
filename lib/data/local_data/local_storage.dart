
// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/utilities/constants.dart';

class SharedPref {
  static late SharedPreferences sharedPref;

  static initialize() async {
    sharedPref = await SharedPreferences.getInstance();
  }
}

class WeatherPreferences {
  //.set  city
  Future setWeatherCache(String city) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(Constants.city,city);
  }

// get. city
  Future getWeatherCache(String city) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    var cache = preferences.getString(Constants.city);
    return cache;
  }

 



}
