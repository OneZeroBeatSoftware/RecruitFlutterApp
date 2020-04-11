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
	if (json['companyName'] != null) {
		data.companyName = json['companyName']?.toString();
	}
	if (json['startDate'] != null) {
		data.startDate = json['startDate']?.toString();
	}
	if (json['endDate'] != null) {
		data.endDate = json['endDate']?.toString();
	}
	if (json['legalPerson'] != null) {
		data.legalPerson = json['legalPerson']?.toString();
	}
	if (json['registerCapital'] != null) {
		data.registerCapital = json['registerCapital']?.toInt();
	}
	if (json['registerDate'] != null) {
		data.registerDate = json['registerDate']?.toInt();
	}
	if (json['operateState'] != null) {
		data.operateState = json['operateState']?.toString();
	}
	if (json['registerAddress'] != null) {
		data.registerAddress = json['registerAddress']?.toString();
	}
	if (json['unifiedCreditCode'] != null) {
		data.unifiedCreditCode = json['unifiedCreditCode']?.toString();
	}
	if (json['companyScale'] != null) {
		data.companyScale = json['companyScale']?.toInt();
	}
	if (json['scope'] != null) {
		data.scope = json['scope']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toInt();
	}
	return data;
}

Map<String, dynamic> blackListDataRecordToJson(BlackListDataRecord entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['companyName'] = entity.companyName;
	data['startDate'] = entity.startDate;
	data['endDate'] = entity.endDate;
	data['legalPerson'] = entity.legalPerson;
	data['registerCapital'] = entity.registerCapital;
	data['registerDate'] = entity.registerDate;
	data['operateState'] = entity.operateState;
	data['registerAddress'] = entity.registerAddress;
	data['unifiedCreditCode'] = entity.unifiedCreditCode;
	data['companyScale'] = entity.companyScale;
	data['scope'] = entity.scope;
	data['state'] = entity.state;
	data['city'] = entity.city;
	return data;
}