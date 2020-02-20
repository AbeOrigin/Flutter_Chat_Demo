import 'user.dart';

class Message {
  User sender;
  String time;
  String text;
  bool isLiked;
  bool unRead;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unRead,
  });

  // set unReadStatus(bool nextValue) {
  //   this.unRead = nextValue;
  // }
}
