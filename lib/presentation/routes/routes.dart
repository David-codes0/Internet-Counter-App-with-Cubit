import 'package:cubit_bloc_counter1/presentation/screens/home_screen.dart';
import 'package:cubit_bloc_counter1/presentation/screens/second_screen.dart';
import 'package:cubit_bloc_counter1/presentation/screens/setting_screen.dart';
import 'package:cubit_bloc_counter1/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static const homeScreen = '/';
  static const secondScreen = '/secondscreen';
  static const thirdScreen = '/Thirdscreen';
  static const settingScreen = '/settingScreen';

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) =>
              const HomeScreen(title: 'Home', color: Colors.blueAccent),
        );
      case secondScreen:
        return MaterialPageRoute(
          builder: (context) =>
              const SecondScreen(title: 'Second Screen', color: Colors.red),
        );
      case thirdScreen:
        return MaterialPageRoute(
          builder: (_) =>
              const ThirdScreen(title: 'Third Screen', color: Colors.purple),
        );
      case settingScreen:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );

      default:
        throw const FormatException('This page could not be found');
    }
  }
}
