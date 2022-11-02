// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/repos/weather_repo.dart';
import 'package:weather_app/helper/custom_text.dart';
class TemperatureViewWidget extends StatefulWidget {
  const TemperatureViewWidget({
    Key? key,
    required this.city,
  }) : super(key: key);

  final TextEditingController city;

  @override
  State<TemperatureViewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<TemperatureViewWidget> {
  String citys = '';
  void getcitydata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    citys = prefs.getString('city')!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getcitydata();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240,
          child: FutureBuilder<WeatherResponse>(
            future: WeatherRepo().weatherRepo(
                city: widget.city.text.isEmpty ?citys:widget.city.text),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //temperature in celsis
                      custom_text(
                          context: context,
                          text:
                              ' temperature in celsius : ${snapshot.data!.main.temp}'),

                      // temperature in text
                      custom_text(
                          context: context,
                          text:
                              'temperature in text : ${snapshot.data!.weather.description}'),
                      //icons
                      custom_text(
                          context: context,
                          text: 'icon : ${snapshot.data!.weather.icon}'),
                      //city
                      custom_text(
                          context: context,
                          text: 'current location : ${snapshot.data!.city}'),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text('No data found'),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
