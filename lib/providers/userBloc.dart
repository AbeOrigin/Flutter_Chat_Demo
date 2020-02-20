import 'dart:async';
import 'dart:convert';
import 'package:chat_demo/blocs/wsHandler.dart';
import 'package:chat_demo/main.dart';
import 'package:chat_demo/models/mattermostResponse.dart';
import 'package:chat_demo/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:chat_demo/navigation/navigationService.dart';

class UserBloc {
  final String onLastError = '';
  static final UserBloc _singleton = UserBloc._internal();
  final WsHandler handler = WsHandler();
  StreamSubscription<dynamic> subscriptionToAuth;
  User _currentLogedInUser;

  factory UserBloc() {
    return _singleton;
  }

  UserBloc._internal();

  void logintoMatterMost(String userEmail, String password) async {
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
      this._currentLogedInUser = User.fromJson(json.decode(response.body));
      var headerToken = parseHeaders(response.headers);
      this.handler.connectToWebSocket('wss://chat.spacedev.uy/api/v4/websocket',
          {"token": headerToken['token']});
      this.handler.sendToWebSocket({
        "seq": this.handler.currentSeq,
        "action": "authentication_challenge",
        "data": {"token": headerToken['token']}
      });
      this.subscriptionToAuth = this
          .handler
          .authorization
          .stream
          .listen((data) => handleAuthEvents(data));
    }
  }

  get currentLogedInUser {
    if (this._currentLogedInUser == null) {
      userLogOut();
    }
    return this._currentLogedInUser;
  }

  void handleAuthEvents(MattermostResponse dataFromAuth) {
    if (dataFromAuth != null) {
      switch (dataFromAuth.event) {
        case 'hello':
          redirectToHome('homeScreen');
          break;
        default:
      }
    }
  }

  void redirectTo(String redirectUrl) {
    locator<NavigationService>().navigateTo(redirectUrl);
  }

  void redirectToHome(String redirectUrl) {
    locator<NavigationService>().navigateToWithPop(redirectUrl);
  }

  void userLogOut() {
    this.handler.disconnectWebSocket();
    this.subscriptionToAuth?.cancel();
    this.redirectTo('login');
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
