import 'package:recruit_app/entity/company_info_entity.dart';

companyInfoEntityFromJson(CompanyInfoEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new CompanyInfoData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> companyInfoEntityToJson(CompanyInfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

companyInfoDataFromJson(CompanyInfoData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['companyName'] != null) {
		data.companyName = json['companyName']?.toString();
	}
	if (json['companySummary'] != null) {
		data.companySummary = json['companySummary']?.toString();
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
		data.registerCapital = json['registerCapital']?.toString();
	}
	if (json['registerDate'] != null) {
		data.registerDate = json['registerDate']?.toInt();
	}
	if (json['management'] != null) {
		data.management = json['management']?.toString();
	}
	if (json['registerAddress'] != null) {
		data.registerAddress = json['registerAddress']?.toString();
	}
	if (json['unifiedCreditCode'] != null) {
		data.unifiedCreditCode = json['unifiedCreditCode']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['scale'] != null) {
		data.scale = json['scale']?.toString();
	}
	if (json['scope'] != null) {
		data.scope = json['scope']?.toString();
	}
	if (json['industry'] != null) {
		data.industry = json['industry']?.toString();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toString();
	}
	return data;
}

Map<String, dynamic> companyInfoDataToJson(CompanyInfoData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['companyName'] = entity.companyName;
	data['companySummary'] = entity.companySummary;
	data['startDate'] = entity.startDate;
	data['endDate'] = entity.endDate;
	data['legalPerson'] = entity.legalPerson;
	data['registerCapital'] = entity.registerCapital;
	data['registerDate'] = entity.registerDate;
	data['management'] = entity.management;
	data['registerAddress'] = entity.registerAddress;
	data['unifiedCreditCode'] = entity.unifiedCreditCode;
	data['avatar'] = entity.avatar;
	data['scale'] = entity.scale;
	data['scope'] = entity.scope;
	data['industry'] = entity.industry;
	data['city'] = entity.city;
	return data;
}