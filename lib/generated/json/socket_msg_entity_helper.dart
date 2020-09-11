import 'package:recruit_app/entity/socket_msg_entity.dart';

socketMsgEntityFromJson(SocketMsgEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['contentType'] != null) {
		data.contentType = json['contentType']?.toString();
	}
	if (json['fromId'] != null) {
		data.fromId = json['fromId']?.toString();
	}
	if (json['groupId'] != null) {
		data.groupId = json['groupId']?.toString();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname']?.toString();
	}
	if (json['sendTime'] != null) {
		data.sendTime = json['sendTime']?.toString();
	}
	if (json['toId'] != null) {
		data.toId = json['toId']?.toString();
	}
	if (json['version'] != null) {
		data.version = json['version']?.toString();
	}
	return data;
}

Map<String, dynamic> socketMsgEntityToJson(SocketMsgEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['content'] = entity.content;
	data['contentType'] = entity.contentType;
	data['fromId'] = entity.fromId;
	data['groupId'] = entity.groupId;
	data['nickname'] = entity.nickname;
	data['sendTime'] = entity.sendTime;
	data['toId'] = entity.toId;
	data['version'] = entity.version;
	return data;
}