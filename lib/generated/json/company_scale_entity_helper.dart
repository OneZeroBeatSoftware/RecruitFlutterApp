import 'package:recruit_app/entity/company_scale_entity.dart';

companyScaleEntityFromJson(CompanyScaleEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<CompanyScaleData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new CompanyScaleData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> companyScaleEntityToJson(CompanyScaleEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

companyScaleDataFromJson(CompanyScaleData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['scaleName'] != null) {
		data.scaleName = json['scaleName']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> companyScaleDataToJson(CompanyScaleData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['scaleName'] = entity.scaleName;
	data['state'] = entity.state;
	return data;
}