// ignore_for_file: avoid_print, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/local_data/local_storage.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/repos/weather_repo.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/routes.dart';
import 'package:weather_app/views/widgets/temperature_view_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen_route';

  HomeScreen({Key? key}) : super(key: key);
  WeatherRepo? weatherRepo;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController city = TextEditingController();
  WeatherResponse? response;
  bool isclicked = false;
  final WeatherPreferences weatherPreferences = WeatherPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home Screen'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, SplashScreenRoute);

            
              },
              icon: Icon(Icons.help))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: city,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'location'),
            ),
          ),
          Consumer<WeatherProvider>(
            builder: (context, value, child) => MaterialButton(
              onPressed: () async {
                weatherPreferences.getWeatherCache('city').then((value) {
                  if (value != null) {
                    print(value.toString());
                  } else {
                    print('null');
                  }
                });

                value.get_city(city: city);
                setState(() {
                  isclicked = true;
                });
              },
              child: city.text.isEmpty ? Text('save') : Text('update'),
            ),
          ),
          // temperature view widget
          TemperatureViewWidget(city: city)
        ]),
      )),
    );
  }
}
