import 'package:recruit_app/entity/company_detail_entity.dart';

companyDetailEntityFromJson(CompanyDetailEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new CompanyDetailData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> companyDetailEntityToJson(CompanyDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

companyDetailDataFromJson(CompanyDetailData data, Map<String, dynamic> json) {
	if (json['company'] != null) {
		data.company = new CompanyDetailDataCompany().fromJson(json['company']);
	}
	if (json['starId'] != null) {
		data.starId = json['starId']?.toString();
	}
	if (json['industries'] != null) {
		data.industries = new List<CompanyDetailDataIndustry>();
		(json['industries'] as List).forEach((v) {
			data.industries.add(new CompanyDetailDataIndustry().fromJson(v));
		});
	}
	if (json['details'] != null) {
		data.details = new List<CompanyDetailDataDetail>();
		(json['details'] as List).forEach((v) {
			data.details.add(new CompanyDetailDataDetail().fromJson(v));
		});
	}
	if (json['welfare'] != null) {
		data.welfare = new List<CompanyDetailDataWelfare>();
		(json['welfare'] as List).forEach((v) {
			data.welfare.add(new CompanyDetailDataWelfare().fromJson(v));
		});
	}
	if (json['tags'] != null) {
		data.tags = new List<CompanyDetailDataTag>();
		(json['tags'] as List).forEach((v) {
			data.tags.add(new CompanyDetailDataTag().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> companyDetailDataToJson(CompanyDetailData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.company != null) {
		data['company'] = entity.company.toJson();
	}
	data['starId'] = entity.starId;
	if (entity.industries != null) {
		data['industries'] =  entity.industries.map((v) => v.toJson()).toList();
	}
	if (entity.details != null) {
		data['details'] =  entity.details.map((v) => v.toJson()).toList();
	}
	if (entity.welfare != null) {
		data['welfare'] =  entity.welfare.map((v) => v.toJson()).toList();
	}
	if (entity.tags != null) {
		data['tags'] =  entity.tags.map((v) => v.toJson()).toList();
	}
	return data;
}

companyDetailDataCompanyFromJson(CompanyDetailDataCompany data, Map<String, dynamic> json) {
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
		data.registerDate = json['registerDate']?.toString();
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
	if (json['managementId'] != null) {
		data.managementId = json['managementId']?.toString();
	}
	if (json['managementName'] != null) {
		data.managementName = json['managementName']?.toString();
	}
	if (json['scaleId'] != null) {
		data.scaleId = json['scaleId']?.toString();
	}
	if (json['scaleName'] != null) {
		data.scaleName = json['scaleName']?.toString();
	}
	if (json['scope'] != null) {
		data.scope = json['scope']?.toString();
	}
	if (json['industryId'] != null) {
		data.industryId = json['industryId']?.toString();
	}
	if (json['industryName'] != null) {
		data.industryName = json['industryName']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['cityId'] != null) {
		data.cityId = json['cityId']?.toString();
	}
	if (json['cityName'] != null) {
		data.cityName = json['cityName']?.toString();
	}
	return data;
}

Map<String, dynamic> companyDetailDataCompanyToJson(CompanyDetailDataCompany entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['companyName'] = entity.companyName;
	data['companySummary'] = entity.companySummary;
	data['startDate'] = entity.startDate;
	data['endDate'] = entity.endDate;
	data['legalPerson'] = entity.legalPerson;
	data['registerCapital'] = entity.registerCapital;
	data['registerDate'] = entity.registerDate;
	data['registerAddress'] = entity.registerAddress;
	data['unifiedCreditCode'] = entity.unifiedCreditCode;
	data['avatar'] = entity.avatar;
	data['managementId'] = entity.managementId;
	data['managementName'] = entity.managementName;
	data['scaleId'] = entity.scaleId;
	data['scaleName'] = entity.scaleName;
	data['scope'] = entity.scope;
	data['industryId'] = entity.industryId;
	data['industryName'] = entity.industryName;
	data['state'] = entity.state;
	data['cityId'] = entity.cityId;
	data['cityName'] = entity.cityName;
	return data;
}

companyDetailDataIndustryFromJson(CompanyDetailDataIndustry data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['industryName'] != null) {
		data.industryName = json['industryName']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['pid'] != null) {
		data.pid = json['pid']?.toString();
	}
	return data;
}

Map<String, dynamic> companyDetailDataIndustryToJson(CompanyDetailDataIndustry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['industryName'] = entity.industryName;
	data['state'] = entity.state;
	data['pid'] = entity.pid;
	return data;
}

companyDetailDataDetailFromJson(CompanyDetailDataDetail data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['companyId'] != null) {
		data.companyId = json['companyId']?.toString();
	}
	if (json['detailsName'] != null) {
		data.detailsName = json['detailsName']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> companyDetailDataDetailToJson(CompanyDetailDataDetail entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['companyId'] = entity.companyId;
	data['detailsName'] = entity.detailsName;
	data['content'] = entity.content;
	data['state'] = entity.state;
	return data;
}

companyDetailDataWelfareFromJson(CompanyDetailDataWelfare data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['companyId'] != null) {
		data.companyId = json['companyId']?.toString();
	}
	if (json['welfareName'] != null) {
		data.welfareName = json['welfareName']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> companyDetailDataWelfareToJson(CompanyDetailDataWelfare entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['companyId'] = entity.companyId;
	data['welfareName'] = entity.welfareName;
	data['content'] = entity.content;
	data['state'] = entity.state;
	return data;
}

companyDetailDataTagFromJson(CompanyDetailDataTag data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['companyId'] != null) {
		data.companyId = json['companyId']?.toString();
	}
	if (json['tagName'] != null) {
		data.tagName = json['tagName']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> companyDetailDataTagToJson(CompanyDetailDataTag entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['companyId'] = entity.companyId;
	data['tagName'] = entity.tagName;
	data['state'] = entity.state;
	return data;
}