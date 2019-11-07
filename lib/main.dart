import 'package:chat_demo/providers/login_provider.dart';
import 'package:chat_demo/screens/home_screen.dart';
import 'package:chat_demo/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

void main() {
  getIt.registerSingleton<LoginProvider>(LoginProvider());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Better looking than Mattermost',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Color(0xFFFEF9EB),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/homeScreen': (context) => HomeScreen(),
      },
    );
  }
}
