import 'package:chat_demo/models/message_model.dart';
import 'package:chat_demo/screens/chat_screen_screen.dart';
import 'package:flutter/material.dart';

class FavoriteContacts extends StatelessWidget {
  const FavoriteContacts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Favorite Contacts',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {},
                  color: Colors.blueGrey,
                  iconSize: 30.0,
                ),
              ],
            ),
          ),
          // Container(
          //   height: 120,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     padding: EdgeInsets.only(left: 10),
          //     itemCount: favUsers.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return GestureDetector(
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (_) => ChatScreen(
          //                 user: favUsers[index],
          //               ),
          //             ),
          //           );
          //         },
          //         child: Padding(
          //           padding: EdgeInsets.all(10.0),
          //           child: Column(
          //             children: <Widget>[
          //               CircleAvatar(
          //                 radius: 35.0,
          //                 backgroundColor: Colors.grey,
          //                 backgroundImage: AssetImage(
          //                   favUsers[index].imageUrl,
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 6.0,
          //               ),
          //               Text(
          //                 favUsers[index].name,
          //                 style: TextStyle(
          //                   color: Colors.blueGrey,
          //                   fontSize: 16.0,
          //                   fontWeight: FontWeight.w600,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
