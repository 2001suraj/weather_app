// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, prefer_const_constructors, avoid_print, prefer_final_fields
import 'package:flutter/material.dart';

import 'package:weather_app/data/local_data/local_storage.dart';
import 'package:weather_app/data/repos/weather_repo.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherRepo weatherRepo;
  WeatherProvider({
    required this.weatherRepo,
  });
  

  WeatherPreferences weatherPreferences = WeatherPreferences();

  get_city({required TextEditingController city}) async {
    WeatherRepo().weatherRepo(city: city.text);

    var response = await weatherRepo.weatherRepo(city: city.text);
    if (response.cod == 200) {
      weatherPreferences
          .setWeatherCache(city.text)
          .whenComplete(() => print('recorded'));
    } else if (response.cod == 400) {
      return Center(child: Text('no data found'));
    }
  }


}
