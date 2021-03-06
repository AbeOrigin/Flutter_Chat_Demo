import 'package:chat_demo/models/user.dart';
import 'package:chat_demo/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      width: MediaQuery.of(context).size.width * 0.75,
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    if (isMe) {
      return msg;
    }

    return Row(
      children: <Widget>[
        msg,
        Expanded(
          child: IconButton(
            icon: message.isLiked
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            iconSize: 30.0,
            color: message.isLiked
                ? Theme.of(context).primaryColor
                : Colors.blueGrey,
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  // need to refactor code to make the chat part of the main component
  _buildMessageComposer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.white, style: BorderStyle.solid),
        ),
      ),
      child: Card(
        elevation: 13.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
        color: Theme.of(context).accentColor,
        child: Row(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(Icons.photo),
                iconSize: 25.0,
                color: Theme.of(context).primaryColor,
                onPressed: () {},
              ),
            ),
            Expanded(
        
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value) {},
                decoration:
                    InputDecoration.collapsed(hintText: 'Send a Message...'),
                    style: TextStyle(
                      fontSize: 20,
                      height: 2,
                    ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                alignment: Alignment.centerRight,
                icon: Icon(Icons.send),
                iconSize: 25.0,
                color: Theme.of(context).primaryColor,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // unMarkingNewInRecentChat();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: widget.user.nickname,
                    child: CircleAvatar(
                      radius: 18.0,
                      backgroundColor: Colors.blueGrey,
                      backgroundImage: AssetImage(
                        'https://scontent.fmvd3-1.fna.fbcdn.net/v/t1.0-9/s960x960/50811794_1241966839285152_5832961223175438336_o.jpg?_nc_cat=109&_nc_ohc=Sm8DWiW3mJAAX_WJ4LC&_nc_ht=scontent.fmvd3-1.fna&_nc_tp=7&oh=c61e4addf2fac208300c50a39d7a05fb&oe=5F021982',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        widget.user.nickname,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      false
                          ? Text(
                              'Online',
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.start,
                            )
                          : Text(
                              'Offline',
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.start,
                            ),
                    ],
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ],
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  // child: ListView.builder(
                  //   reverse: true,
                  //   padding: EdgeInsets.only(top: 15.0),
                  //   itemCount: 15,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     final Message message = messages[index];
                  //     final bool isMe = message.sender.id == currentUser.id;
                  //     return _buildMessage(message, isMe);
                  //   },
                  // ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

  // void unMarkingNewInRecentChat() {
  //   chats.forEach((chat) {
  //     print(chat);
  //     if (chat.sender.id == widget.user.id) {
  //       chat.unRead = false;
  //     }
  //   });
  // }
}
