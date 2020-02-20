class Channel {
  String id;
  int createAt;
  int updateAt;
  int deleteAt;
  String teamId;
  String type;
  String displayName;
  String name;
  String header;
  String purpose;
  int lastPostAt;
  int totalMsgCount;
  String extraUpdateAt;
  String creatorId;
  dynamic schemeId;
  dynamic props;
  dynamic groupConstrained;

  Channel(
      {this.id,
      this.createAt,
      this.updateAt,
      this.deleteAt,
      this.teamId,
      this.type,
      this.displayName,
      this.name,
      this.header,
      this.purpose,
      this.lastPostAt,
      this.totalMsgCount,
      this.extraUpdateAt,
      this.creatorId,
      this.schemeId,
      this.props,
      this.groupConstrained});

  factory Channel.fromJson(Map<String, dynamic> jsonChannel) {
    return Channel(
      id: jsonChannel['id'],
      createAt: jsonChannel['create_at'],
      updateAt: jsonChannel['update_at'],
      deleteAt: jsonChannel['deleted_at'],
      teamId: jsonChannel['team_id'],
      type: jsonChannel['type'],
      displayName: jsonChannel['display_name'],
      name: jsonChannel['name'],
      header: jsonChannel['header'],
      purpose: jsonChannel['purpose'],
      lastPostAt: jsonChannel['last_post_at'],
      totalMsgCount: jsonChannel['total_msg_count'],
      extraUpdateAt: jsonChannel['extra_update_at'],
      creatorId: jsonChannel['creator_at'],
      schemeId: jsonChannel['scheme_id'],
      props: jsonChannel['props'],
      groupConstrained: jsonChannel['group_constrained'],
    );
  }
}
