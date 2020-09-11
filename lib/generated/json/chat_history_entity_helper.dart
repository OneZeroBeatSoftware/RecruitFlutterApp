import 'package:recruit_app/entity/chat_history_entity.dart';

chatHistoryEntityFromJson(ChatHistoryEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<ChatHistoryData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new ChatHistoryData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> chatHistoryEntityToJson(ChatHistoryEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

chatHistoryDataFromJson(ChatHistoryData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['fromId'] != null) {
		data.fromId = json['fromId']?.toInt();
	}
	if (json['toId'] != null) {
		data.toId = json['toId']?.toInt();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['contentType'] != null) {
		data.contentType = json['contentType']?.toInt();
	}
	if (json['sendTime'] != null) {
		data.sendTime = json['sendTime']?.toInt();
	}
	if (json['isLook'] != null) {
		data.isLook = json['isLook']?.toInt();
	}
	return data;
}

Map<String, dynamic> chatHistoryDataToJson(ChatHistoryData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['fromId'] = entity.fromId;
	data['toId'] = entity.toId;
	data['content'] = entity.content;
	data['contentType'] = entity.contentType;
	data['sendTime'] = entity.sendTime;
	data['isLook'] = entity.isLook;
	return data;
}