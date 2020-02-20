import 'package:chat_demo/navigation/navigationService.dart';
import 'package:chat_demo/screens/home_screen.dart';
import 'package:chat_demo/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

String baseURL = 'https://chat.spacedev.uy/api/v4/';
GetIt locator = GetIt.I;

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Better looking than Mattermost',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Color(0xFFFEF9EB),
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'homeScreen':
            return MaterialPageRoute(builder: (context) => HomeScreen());
            break;
          case 'login':
            return MaterialPageRoute(builder: (context) => LoginScreen());
            break;
          default:
            return MaterialPageRoute(builder: (context) => LoginScreen());
        }
      },
      home: LoginScreen(),
    );
  }
}

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
