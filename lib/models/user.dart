import 'dart:developer';

import 'package:chat_demo/main.dart';

class User {
  User({
    this.createdAt,
    this.email,
    this.firstName,
    this.id,
    this.lastName,
    this.pictureDate,
    this.nickname,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
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

  String getUserImageUrl() {
    return '${baseURL}users/${this.id}/image?_=${this.pictureDate}';
  }

  Map<String, String> getNecessaryHeaders() {
    return {
      'Sec-Fetch-Dest': 'image',
      'DNT': '1',
      'Content-Type': 'application/json'
    };
  }
}
