class MattermostResponse {
  String event;
  dynamic data;
  MattermostResponseBroadcast brodcast;
  int seq;

  MattermostResponse(
    this.event,
    this.data,
    this.brodcast,
    this.seq,
  );

  factory MattermostResponse.fromJson(dynamic json) {
    return MattermostResponse(
        json['event'] as String,
        json['data'] as dynamic,
        MattermostResponseBroadcast.fromJson(json['broadcast']),
        json['seq'] as int);
  }
}

class MattermostResponseBroadcast {
  String omitUsers;
  String userId;
  String channelId;
  String teamId;

  MattermostResponseBroadcast(
      this.omitUsers, this.userId, this.channelId, this.teamId);

  factory MattermostResponseBroadcast.fromJson(dynamic json) {
    if(json == null){
      return null;
    }
    return MattermostResponseBroadcast(
      json['omit_user'] as String,
      json['user_id'] as String,
      json['channel_id'] as String,
      json['team_id'] as String,
    );
  }
}
