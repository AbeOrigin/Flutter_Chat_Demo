import 'package:chat_demo/widgets/category_selector.dart';
import 'package:chat_demo/widgets/favorite_contacts.dart';
import 'package:chat_demo/widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// To-do Read state
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            SizedBox(
              width: 40,
            ),
            FadeInImage.assetNetwork(
              width: 200,
              height: 100,
              alignment: Alignment.center,
              fit: BoxFit.contain,
              fadeInCurve: Curves.decelerate,
              placeholder: 'assets/images/space.gif',
              image: 'https://spacedev.uy/assets/img/space.png',
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        elevation: 0.0,
        actions: <Widget>[
          Expanded(
            flex: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: CircleAvatar(
                radius: 19.0,
                backgroundColor: Theme.of(context).accentColor,
                backgroundImage: AssetImage('assets/images/me.jpg'),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
