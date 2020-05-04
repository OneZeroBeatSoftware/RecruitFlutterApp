import 'package:recruit_app/entity/mine_info_entity.dart';

mineInfoEntityFromJson(MineInfoEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new MineInfoData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> mineInfoEntityToJson(MineInfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

mineInfoDataFromJson(MineInfoData data, Map<String, dynamic> json) {
	if (json['jobSeeker'] != null) {
		data.jobSeeker = new MineInfoDataJobSeeker().fromJson(json['jobSeeker']);
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

Map<String, dynamic> mineInfoDataToJson(MineInfoData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.jobSeeker != null) {
		data['jobSeeker'] = entity.jobSeeker.toJson();
	}
	data['applyCount1'] = entity.applyCount1;
	data['applyCount2'] = entity.applyCount2;
	data['applyCount3'] = entity.applyCount3;
	return data;
}

mineInfoDataJobSeekerFromJson(MineInfoDataJobSeeker data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toString();
	}
	if (json['realName'] != null) {
		data.realName = json['realName']?.toString();
	}
	if (json['jobState'] != null) {
		data.jobState = json['jobState']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['jobIntentionTotal'] != null) {
		data.jobIntentionTotal = json['jobIntentionTotal']?.toInt();
	}
	if (json['jobIntentionCurrent'] != null) {
		data.jobIntentionCurrent = json['jobIntentionCurrent']?.toInt();
	}
	if (json['resumeTotal'] != null) {
		data.resumeTotal = json['resumeTotal']?.toInt();
	}
	if (json['resumeCurrent'] != null) {
		data.resumeCurrent = json['resumeCurrent']?.toInt();
	}
	return data;
}

Map<String, dynamic> mineInfoDataJobSeekerToJson(MineInfoDataJobSeeker entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['userId'] = entity.userId;
	data['realName'] = entity.realName;
	data['jobState'] = entity.jobState;
	data['avatar'] = entity.avatar;
	data['jobIntentionTotal'] = entity.jobIntentionTotal;
	data['jobIntentionCurrent'] = entity.jobIntentionCurrent;
	data['resumeTotal'] = entity.resumeTotal;
	data['resumeCurrent'] = entity.resumeCurrent;
	return data;
}