import 'package:chat_demo/models/user.dart';
import 'package:chat_demo/providers/userBloc.dart';
import 'package:chat_demo/widgets/category_selector.dart';
import 'package:chat_demo/widgets/favorite_contacts.dart';
import 'package:chat_demo/widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BuildContext _context;
  UserBloc _userBloc = UserBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: HeaderRow(),
        elevation: 0.0,
        actions: <Widget>[
          UserIconHome(this._userBloc.currentLogedInUser),
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

class UserIconHome extends StatelessWidget {
  User currentLogedInUser;

  UserIconHome(User currentLogedInUser) {
    this.currentLogedInUser = currentLogedInUser;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: CircleAvatar(
          radius: 19.0,
          backgroundColor: Theme.of(context).accentColor,
          backgroundImage:
              NetworkImage(this.currentLogedInUser?.getUserImageUrl(), headers: this.currentLogedInUser?.getNecessaryHeaders()),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
