import 'package:recruit_app/entity/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new UserData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

userDataFromJson(UserData data, Map<String, dynamic> json) {
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	if (json['jobSeekerId'] != null) {
		data.jobSeekerId = json['jobSeekerId']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toString();
	}
	if (json['recruiterId'] != null) {
		data.recruiterId = json['recruiterId']?.toString();
	}
	if (json['phone'] != null) {
		data.phone = json['phone']?.toString();
	}
	if (json['email'] != null) {
		data.email = json['email']?.toString();
	}
	return data;
}

Map<String, dynamic> userDataToJson(UserData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['token'] = entity.token;
	data['jobSeekerId'] = entity.jobSeekerId;
	data['userId'] = entity.userId;
	data['recruiterId'] = entity.recruiterId;
	data['phone'] = entity.phone;
	data['email'] = entity.email;
	return data;
}