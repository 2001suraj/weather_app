

// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:weather_app/views/screen/home_screen/home_screen.dart';
import 'package:weather_app/views/screen/splash_screen/splash_screen.dart';

const String SplashScreenRoute = '/splash_screen_route';
const String HomeScreenRoute = '/home_screen_route';

final routeScreen = {
  SplashScreenRoute: (context) => SplashScreen(),
  HomeScreenRoute:(context)=>HomeScreen()
};
