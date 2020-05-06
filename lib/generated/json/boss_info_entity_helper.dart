import 'package:recruit_app/entity/boss_info_entity.dart';

bossInfoEntityFromJson(BossInfoEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new BossInfoData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> bossInfoEntityToJson(BossInfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

bossInfoDataFromJson(BossInfoData data, Map<String, dynamic> json) {
	if (json['recruiter'] != null) {
		data.recruiter = new BossInfoDataRecruiter().fromJson(json['recruiter']);
	}
	if (json['applyCount1'] != null) {
		data.applyCount1 = json['applyCount1']?.toInt();
	}
	if (json['applyCount2'] != null) {
		data.applyCount2 = json['applyCount2']?.toInt();
	}
	if (json['applyCount3'] != null) {
		data.applyCount3 = json['applyCount3']?.toInt();
	}
	return data;
}

Map<String, dynamic> bossInfoDataToJson(BossInfoData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.recruiter != null) {
		data['recruiter'] = entity.recruiter.toJson();
	}
	data['applyCount1'] = entity.applyCount1;
	data['applyCount2'] = entity.applyCount2;
	data['applyCount3'] = entity.applyCount3;
	return data;
}

bossInfoDataRecruiterFromJson(BossInfoDataRecruiter data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toString();
	}
	if (json['companyId'] != null) {
		data.companyId = json['companyId']?.toString();
	}
	if (json['realName'] != null) {
		data.realName = json['realName']?.toString();
	}
	return data;
}

Map<String, dynamic> bossInfoDataRecruiterToJson(BossInfoDataRecruiter entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['avatar'] = entity.avatar;
	data['userId'] = entity.userId;
	data['companyId'] = entity.companyId;
	data['realName'] = entity.realName;
	return data;
}