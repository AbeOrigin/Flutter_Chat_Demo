import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

import 'package:chat_demo/screens/login_screen.dart';
import 'package:web_socket_channel/io.dart';

class LoginProvider {
  final String onLastError = '';

  BehaviorSubject<UserPostLogin> _currentUser = BehaviorSubject();
  BehaviorSubject _login = BehaviorSubject.seeded(false);
  BehaviorSubject _messageListChat = new BehaviorSubject();
  var channel;

  Observable get stream$ => _login.stream;
  Observable<UserPostLogin> get currentUser$ => _currentUser;

  Future<UserPostLogin> logintoMatterMost(
      String userEmail, String password, context) async {
    final BodyOfLogin loginBody = BodyOfLogin(
      device_id: '',
      login_id: userEmail,
      password: password.toString(),
      token: '',
    );
    final response = await http.post(
        Uri.encodeFull('https://chat.spacedev.uy/api/v4/users/login'),
        body: json.encode(loginBody.toJson()),
        headers: {'content-type': 'application/json'});
    if (response.statusCode == 200) {
      final jsonFormated = UserPostLogin.fromJson(json.decode(response.body));
      var headerToken = parseHeaders(response.headers);
      channel =
          IOWebSocketChannel.connect('wss://chat.spacedev.uy/api/v4/websocket', headers:{"token": headerToken['token']} );
      channel.sink.add({
        "seq": 1,
        "action": "authentication_challenge",
        "data": {"token": headerToken['token']}
      });
      channel.stream.listen((data) => print(data));
      _currentUser.add(jsonFormated);
      Navigator.pushReplacementNamed(context, '/homeScreen');
      return jsonFormated;
    } else {
      final errorDialog = ErrorLogin();
      showDialog(
        context: context,
        builder: (_) => errorDialog,
        barrierDismissible: true,
      );
    }
  }
}

parseHeaders(Map<String, dynamic> json) {
  return ({'token': json['token']});
}

class BodyOfLogin {
  BodyOfLogin({
    this.device_id,
    this.login_id,
    this.password,
    this.token,
  });

  final String device_id;
  final String login_id;
  final String password;
  final String token;

  Map<String, dynamic> toJson() {
    return {
      'device_id': device_id,
      'login_id': login_id,
      'password': password,
      'token': token,
    };
  }
}

class UserPostLogin {
  UserPostLogin({
    this.createdAt,
    this.email,
    this.firstName,
    this.id,
    this.lastName,
    this.pictureDate,
    this.nickname,
  });

  factory UserPostLogin.fromJson(Map<String, dynamic> json) {
    return UserPostLogin(
      createdAt: json['create_at'],
      email: json['email'],
      firstName: json['first_name'],
      id: json['id'],
      lastName: json['last_name'],
      pictureDate: json['last_picture_update'],
      nickname: json['nickname'],
    );
  }

  final int createdAt;
  final String email;
  final String firstName;
  final String id;
  final String lastName;
  final String nickname;
  final int pictureDate;
}
