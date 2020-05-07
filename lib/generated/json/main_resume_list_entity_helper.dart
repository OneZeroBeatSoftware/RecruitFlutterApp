import 'package:recruit_app/entity/main_resume_list_entity.dart';

mainResumeListEntityFromJson(MainResumeListEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new MainResumeListData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> mainResumeListEntityToJson(MainResumeListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

mainResumeListDataFromJson(MainResumeListData data, Map<String, dynamic> json) {
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
		data.records = new List<MainResumeListDataRecord>();
		(json['records'] as List).forEach((v) {
			data.records.add(new MainResumeListDataRecord().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> mainResumeListDataToJson(MainResumeListData entity) {
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

mainResumeListDataRecordFromJson(MainResumeListDataRecord data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['starId'] != null) {
		data.starId = json['starId']?.toString();
	}
	if (json['shieldId'] != null) {
		data.shieldId = json['shieldId']?.toString();
	}
	if (json['jobSeekerId'] != null) {
		data.jobSeekerId = json['jobSeekerId']?.toString();
	}
	if (json['realName'] != null) {
		data.realName = json['realName']?.toString();
	}
	if (json['resumeName'] != null) {
		data.resumeName = json['resumeName']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['sex'] != null) {
		data.sex = json['sex']?.toInt();
	}
	if (json['workDateName'] != null) {
		data.workDateName = json['workDateName']?.toString();
	}
	if (json['minSalary'] != null) {
		data.minSalary = json['minSalary']?.toInt();
	}
	if (json['maxSalary'] != null) {
		data.maxSalary = json['maxSalary']?.toInt();
	}
	if (json['educationName'] != null) {
		data.educationName = json['educationName']?.toString();
	}
	return data;
}

Map<String, dynamic> mainResumeListDataRecordToJson(MainResumeListDataRecord entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['starId'] = entity.starId;
	data['shieldId'] = entity.shieldId;
	data['jobSeekerId'] = entity.jobSeekerId;
	data['realName'] = entity.realName;
	data['resumeName'] = entity.resumeName;
	data['avatar'] = entity.avatar;
	data['sex'] = entity.sex;
	data['workDateName'] = entity.workDateName;
	data['minSalary'] = entity.minSalary;
	data['maxSalary'] = entity.maxSalary;
	data['educationName'] = entity.educationName;
	return data;
}