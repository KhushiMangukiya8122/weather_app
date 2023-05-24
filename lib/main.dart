import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/contoller/provider/weather_provider.dart';
import 'package:weather_app/views/screens/homepage.dart';
import 'package:weather_app/views/screens/splash_screen.dart';
import 'package:weather_app/views/screens/manage_cities_page.dart';
import 'package:weather_app/views/screens/add_city_page.dart';
import 'package:weather_app/views/screens/setting_page.dart';
import 'package:weather_app/views/screens/temperature_unit_page.dart';
import 'package:weather_app/views/screens/about_page.dart';
import 'contoller/provider/connectivty_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode:ThemeMode.system,
        routes: {
          '/': (context) => SplashScreen(),
          'home_page': (context) => HomePage(),
          'manage_cities_page': (context) => ManageCitiesPage(),
          'add_city_page': (context) => AddCityPage(),
          'setting_page': (context) => SettingPage(),
          'temperature_unit_page': (context) => TemperatureUnitPage(),
          'about_page': (context) => AboutPage(),
        },
      ),
    ),
  );
}
