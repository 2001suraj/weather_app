// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/data/local_data/local_storage.dart';
import 'package:weather_app/routes.dart';

class SplashScreen extends StatefulWidget {
    static const String routeName = '/splash_screen_route';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final WeatherPreferences weatherPreferences = WeatherPreferences();
  String city = '';
  void getcitydata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    city = prefs.getString('city')!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getcitydata();
    _navigatedToHomeScreen();
  }

  _navigatedToHomeScreen() async {
    weatherPreferences.getWeatherCache('city').then((value) {
        if (value != null) {
        return Timer(Duration(seconds: 5), () {
          print(value.toString());
                Navigator.pushReplacementNamed(context, HomeScreenRoute);

        });
      } else {
        return Timer(Duration(seconds: 5), () {
          print(value.toString());
                Navigator.pushReplacementNamed(context, HomeScreenRoute);

        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://www.vhv.rs/dpng/d/427-4270068_gold-retro-decorative-frame-png-free-download-transparent.png')),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'We show weather for you',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          TextButton(
            onPressed: () {
                Navigator.pushReplacementNamed(context, HomeScreenRoute);

            },
            child: Text('Skip'),
          ),
        ],
      ),
    ));
  }
}
