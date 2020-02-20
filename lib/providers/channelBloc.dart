import 'dart:async';
import 'dart:convert';
import 'package:chat_demo/blocs/wsHandler.dart';
import 'package:chat_demo/main.dart';
import 'package:chat_demo/models/channel.model.dart';
import 'package:chat_demo/models/mattermostResponse.dart';
import 'package:chat_demo/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:chat_demo/navigation/navigationService.dart';

class ChannelBlc {

  String onLastError = '';
  static final ChannelBlc _singleton = ChannelBlc._internal();
  final WsHandler handler = WsHandler();

  // Subscription For events
  StreamSubscription<dynamic> subscriptionForChannels;

  // Data To Hold
  List<Channel> _listOfChannels;

  factory ChannelBlc() {
    return _singleton;
  }

  ChannelBlc._internal();

  Future<void> getChannels(){
    try {
      
    } catch (e) {
      this.onLastError = 'Could not load Channels' ;
    }
  }


  void redirectTo(String redirectUrl) {
    locator<NavigationService>().navigateTo(redirectUrl);
  }
}
