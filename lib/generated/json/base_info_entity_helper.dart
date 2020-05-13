import 'package:recruit_app/entity/base_info_entity.dart';

baseInfoEntityFromJson(BaseInfoEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new BaseInfoData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> baseInfoEntityToJson(BaseInfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

baseInfoDataFromJson(BaseInfoData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toString();
	}
	if (json['realName'] != null) {
		data.realName = json['realName']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	return data;
}

Map<String, dynamic> baseInfoDataToJson(BaseInfoData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['userId'] = entity.userId;
	data['realName'] = entity.realName;
	data['avatar'] = entity.avatar;
	return data;
}