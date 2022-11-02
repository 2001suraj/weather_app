import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/routes.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (_)=>locators<WeatherProvider>())
       ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
     
          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashScreenRoute,
        routes: routeScreen,


      ),
    );
  }
}

