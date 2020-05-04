import 'package:recruit_app/entity/black_list_entity.dart';

blackListEntityFromJson(BlackListEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new BlackListData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> blackListEntityToJson(BlackListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

blackListDataFromJson(BlackListData data, Map<String, dynamic> json) {
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
		data.records = new List<BlackListDataRecord>();
		(json['records'] as List).forEach((v) {
			data.records.add(new BlackListDataRecord().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> blackListDataToJson(BlackListData entity) {
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

blackListDataRecordFromJson(BlackListDataRecord data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['shieldId'] != null) {
		data.shieldId = json['shieldId']?.toString();
	}
	if (json['companyName'] != null) {
		data.companyName = json['companyName']?.toString();
	}
	if (json['registerAddress'] != null) {
		data.registerAddress = json['registerAddress']?.toString();
	}
	if (json['managementName'] != null) {
		data.managementName = json['managementName']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['cityName'] != null) {
		data.cityName = json['cityName']?.toString();
	}
	if (json['scaleName'] != null) {
		data.scaleName = json['scaleName']?.toString();
	}
	if (json['industryName'] != null) {
		data.industryName = json['industryName']?.toString();
	}
	return data;
}

Map<String, dynamic> blackListDataRecordToJson(BlackListDataRecord entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['shieldId'] = entity.shieldId;
	data['companyName'] = entity.companyName;
	data['registerAddress'] = entity.registerAddress;
	data['managementName'] = entity.managementName;
	data['avatar'] = entity.avatar;
	data['cityName'] = entity.cityName;
	data['scaleName'] = entity.scaleName;
	data['industryName'] = entity.industryName;
	return data;
}