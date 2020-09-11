import 'package:recruit_app/entity/msg_list_entity.dart';

msgListEntityFromJson(MsgListEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<MsgListData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new MsgListData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> msgListEntityToJson(MsgListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

msgListDataFromJson(MsgListData data, Map<String, dynamic> json) {
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['toRoleImgUrl'] != null) {
		data.toRoleImgUrl = json['toRoleImgUrl']?.toString();
	}
	if (json['toRoleName'] != null) {
		data.toRoleName = json['toRoleName']?.toString();
	}
	if (json['newestMessage'] != null) {
		data.newestMessage = json['newestMessage']?.toString();
	}
	if (json['newestTime'] != null) {
		data.newestTime = json['newestTime']?.toInt();
	}
	return data;
}

Map<String, dynamic> msgListDataToJson(MsgListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['userId'] = entity.userId;
	data['toRoleImgUrl'] = entity.toRoleImgUrl;
	data['toRoleName'] = entity.toRoleName;
	data['newestMessage'] = entity.newestMessage;
	data['newestTime'] = entity.newestTime;
	return data;
}