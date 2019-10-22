import 'package:chat_demo/models/user_mode.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unRead;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unRead,
  });
}

// Me
final User currentUser =
    User(id: 0, name: 'Abraham Kazerian', imageUrl: 'assets/images/me.jpg');

final User ilan =
    User(id: 1, name: 'Ilan Garcia', imageUrl: 'assets/images/ilan.jpg');

final User juan =
    User(id: 2, name: 'Juan Vico', imageUrl: 'assets/images/vico.jpg');

final User pela =
    User(id: 3, name: 'Juan Manuel Sobral', imageUrl: 'assets/images/pela.png');

final User fede =
    User(id: 4, name: 'Federico Sendra', imageUrl: 'assets/images/fede.png');

final User flo =
    User(id: 5, name: 'Florencia Pereira', imageUrl: 'assets/images/flo.jpg');

final User florTwo = User(
    id: 11, name: 'Florencia Mosquera', imageUrl: 'assets/images/floTwo.png');

final User jesus =
    User(id: 6, name: 'Jesus Aguiar', imageUrl: 'assets/images/jesus.jpg');

final User edgar =
    User(id: 7, name: 'Edgar Contreras', imageUrl: 'assets/images/edgar.jpg');

final User joel =
    User(id: 8, name: 'Joel Suarez', imageUrl: 'assets/images/joel.jpg');

final User bruno =
    User(id: 9, name: 'Bruno Balduccio', imageUrl: 'assets/images/bruno.jpg');

final User manuel =
    User(id: 10, name: 'Manuel Domingo', imageUrl: 'assets/images/manuel.jpg');

final User dany =
    User(id: 12, name: 'Daniel Sosa', imageUrl: 'assets/images/dany.png');

List<User> favUsers = [
  flo,
  florTwo,
  juan,
  fede,
  bruno,
  joel,
  manuel,
  ilan,
  edgar,
  pela,
  jesus,
  dany
];

List<Message> chats = [
  Message(
    sender: fede,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unRead: true,
  ),
  Message(
    sender: ilan,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unRead: true,
  ),
  Message(
    sender: juan,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unRead: false,
  ),
  Message(
    sender: edgar,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unRead: true,
  ),
  Message(
    sender: joel,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unRead: false,
  ),
  Message(
    sender: bruno,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unRead: false,
  ),
  Message(
    sender: flo,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unRead: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: ilan,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unRead: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unRead: true,
  ),
  Message(
    sender: ilan,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unRead: true,
  ),
  Message(
    sender: ilan,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unRead: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unRead: true,
  ),
  Message(
    sender: ilan,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unRead: true,
  ),
];
