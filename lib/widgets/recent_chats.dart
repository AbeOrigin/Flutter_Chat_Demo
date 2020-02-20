import 'package:chat_demo/models/message_model.dart';
import 'package:chat_demo/screens/chat_screen_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //Show with symetric
        padding: EdgeInsets.only(left: 5.0, top: 1.0, bottom: 1.0, right: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
          // child: ListView.builder(
          //   itemCount: chats.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     final Message chat = chats[index];
          //     return GestureDetector(
          //       onTap: () => Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (_) => ChatScreen(
          //             user: chat.sender,
          //           ),
          //         ),
          //       ),
          //       child: Container(
          //         margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          //         padding:
          //             EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          //         decoration: BoxDecoration(
          //           color: chat.unRead ? Color(0xFFFFEFEE) : Colors.white,
          //           borderRadius: BorderRadius.only(
          //             topRight: Radius.circular(20.0),
          //             bottomRight: Radius.circular(20.0),
          //             topLeft: Radius.circular(20.0),
          //             bottomLeft: Radius.circular(20.0),
          //           ),
          //         ),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: <Widget>[
          //             Row(
          //               children: <Widget>[
          //                 Hero(
          //                   tag: chat.sender.name,
          //                   child: CircleAvatar(
          //                     radius: 35.0,
          //                     backgroundColor: Theme.of(context).accentColor,
          //                     backgroundImage: AssetImage(chat.sender.imageUrl),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 10.0,
          //                 ),
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: <Widget>[
          //                     Text(
          //                       chat.sender.name,
          //                       style: TextStyle(
          //                         color: Colors.grey,
          //                         fontSize: 15.0,
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: 5.0,
          //                     ),
          //                     Container(
          //                       width: MediaQuery.of(context).size.width * 0.5,
          //                       child: Text(
          //                         chat.text,
          //                         style: TextStyle(
          //                           color: Colors.blueGrey,
          //                           fontSize: 15.0,
          //                           fontWeight: FontWeight.w600,
          //                         ),
          //                         overflow: TextOverflow.ellipsis,
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //               ],
          //             ),
          //             Column(
          //               children: <Widget>[
          //                 Text(
          //                   chat.time,
          //                   style: TextStyle(
          //                       color: Colors.grey,
          //                       fontSize: 15.0,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //                 SizedBox(
          //                   height: 10.0,
          //                 ),
          //                 chat.unRead
          //                     ? Container(
          //                         width: 40.0,
          //                         height: 20.0,
          //                         decoration: BoxDecoration(
          //                           borderRadius: BorderRadius.circular(30.0),
          //                           color: Theme.of(context).primaryColor,
          //                         ),
          //                         alignment: Alignment.center,
          //                         child: Text(
          //                           'NEW',
          //                           style: TextStyle(
          //                             color: Colors.white,
          //                             fontSize: 10.0,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                       )
          //                     : Text(''),
          //               ],
          //             )
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
