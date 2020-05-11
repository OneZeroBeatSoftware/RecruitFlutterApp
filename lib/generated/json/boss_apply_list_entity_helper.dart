import 'package:recruit_app/entity/boss_apply_list_entity.dart';

bossApplyListEntityFromJson(BossApplyListEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new BossApplyListData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> bossApplyListEntityToJson(BossApplyListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

bossApplyListDataFromJson(BossApplyListData data, Map<String, dynamic> json) {
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['pages'] != null) {
		data.pages = json['pages']?.toInt();
	}
	if (json['current'] != null) {
		data.current = json['current']?.toInt();
	}
	if (json['records'] != null) {
		data.records = new List<BossApplyListDataRecord>();
		(json['records'] as List).forEach((v) {
			data.records.add(new BossApplyListDataRecord().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> bossApplyListDataToJson(BossApplyListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['size'] = entity.size;
	data['pages'] = entity.pages;
	data['current'] = entity.current;
	if (entity.records != null) {
		data['records'] =  entity.records.map((v) => v.toJson()).toList();
	}
	return data;
}

bossApplyListDataRecordFromJson(BossApplyListDataRecord data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['resumeId'] != null) {
		data.resumeId = json['resumeId']?.toString();
	}
	if (json['resumeName'] != null) {
		data.resumeName = json['resumeName']?.toString();
	}
	if (json['sex'] != null) {
		data.sex = json['sex']?.toInt();
	}
	if (json['minSalary'] != null) {
		data.minSalary = json['minSalary']?.toString();
	}
	if (json['maxSalary'] != null) {
		data.maxSalary = json['maxSalary']?.toString();
	}
	if (json['realName'] != null) {
		data.realName = json['realName']?.toString();
	}
	if (json['workDateName'] != null) {
		data.workDateName = json['workDateName']?.toString();
	}
	if (json['educationName'] != null) {
		data.educationName = json['educationName']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['applyDate'] != null) {
		data.applyDate = json['applyDate']?.toInt();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	return data;
}

Map<String, dynamic> bossApplyListDataRecordToJson(BossApplyListDataRecord entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['resumeId'] = entity.resumeId;
	data['resumeName'] = entity.resumeName;
	data['sex'] = entity.sex;
	data['minSalary'] = entity.minSalary;
	data['maxSalary'] = entity.maxSalary;
	data['realName'] = entity.realName;
	data['workDateName'] = entity.workDateName;
	data['educationName'] = entity.educationName;
	data['state'] = entity.state;
	data['applyDate'] = entity.applyDate;
	data['avatar'] = entity.avatar;
	return data;
}