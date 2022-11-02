
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/data/repos/weather_repo.dart';
import 'package:weather_app/provider/weather_provider.dart';

final locators = GetIt.instance;

void setup() async {
  final sharedPref = await SharedPreferences.getInstance();
  locators.registerLazySingleton(() => sharedPref);


 //repo 
  locators.registerLazySingleton<WeatherRepo>(
      () => WeatherRepo());

  //weather provider
  locators.registerLazySingleton(
      () => WeatherProvider(weatherRepo: locators()));
}
