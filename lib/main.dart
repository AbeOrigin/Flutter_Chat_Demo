import 'package:chat_demo/screens/home_screen.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Better looking than Mattermost',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor:  Color(0xFFFEF9EB),
      ),
      home: HomeScreen(),
    );
  }
}