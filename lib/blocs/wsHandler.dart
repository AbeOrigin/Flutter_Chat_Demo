import 'dart:async';
import 'dart:convert';
import 'package:chat_demo/models/mattermostResponse.dart';
import 'package:web_socket_channel/io.dart';

class WsHandler {
  static final WsHandler _singleton = WsHandler._internal();
  bool _wsIsAvailable;
  IOWebSocketChannel _ws;
  int _seq;
  StreamSubscription<dynamic> _handleListenData;
  StreamController<dynamic> authorization = StreamController.broadcast();

  factory WsHandler() {
    return _singleton;
  }

  WsHandler._internal();

  int get currentSeq {
    if(_seq == null){
      this._seq = 0;
    }
    this._seq = this._seq + 1;
    return this._seq;
  }

  bool isWebSocketAvailable() {
    return this._wsIsAvailable;
  }

  bool connectToWebSocket(
    String urlForWebSocket, Map<String, dynamic> headers) {
    this._ws = IOWebSocketChannel.connect(urlForWebSocket, headers: headers);
    this._wsIsAvailable = true;
    return this.isWebSocketAvailable();
  }

  bool disconnectWebSocket() {
    if (this._wsIsAvailable) {
      this._ws = null;
      this._wsIsAvailable = false;
      this._handleListenData.cancel();
    }
    return this.isWebSocketAvailable();
  }

  void sendToWebSocket(dynamic socketMessage) {
    if (this.isWebSocketAvailable()) {
      this._handleListenData =
          this._ws.stream.listen((data) => receiveDataFromWebSocket(data));
      this._ws.sink.add(json.encode(socketMessage));
    }
    return;
  }

  void receiveDataFromWebSocket(dynamic data) {
    MattermostResponse dataParsed =
        new MattermostResponse.fromJson(json.decode(data));
    this.authorization.sink.add(dataParsed);
    return;
  }
}

final listOfEvents = [
  'added_to_team',
  'authentication_challenge',
  'channel_converted',
  'channel_created',
  'channel_deleted',
  'channel_member_updated',
  'channel_updated',
  'channel_viewed',
  'config_changed',
  'delete_team',
  'direct_added',
  'emoji_added',
  'ephemeral_message',
  'group_added',
  'hello',
  'leave_team',
  'license_changed',
  'memberrole_updated',
  'new_user',
  'plugin_disabled',
  'plugin_enabled',
  'plugin_statuses_changed',
  'post_deleted',
  'post_edited',
  'post_unread',
  'posted',
  'preference_changed',
  'preferences_changed',
  'preferences_deleted',
  'reaction_added',
  'reaction_removed',
  'response',
  'role_updated',
  'status_change',
  'typing',
  'update_team',
  'user_added',
  'user_removed',
  'user_role_updated',
  'user_updated',
  'dialog_opened'
];
