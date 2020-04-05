import 'package:recruit_app/entity/industry_type_entity.dart';

industryTypeEntityFromJson(IndustryTypeEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<IndustryTypeData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new IndustryTypeData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> industryTypeEntityToJson(IndustryTypeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

industryTypeDataFromJson(IndustryTypeData data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['isChecked'] != null) {
		data.isChecked = json['isChecked'];
	}
	if (json['subType'] != null) {
		data.subType = json['subType']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> industryTypeDataToJson(IndustryTypeData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['isChecked'] = entity.isChecked;
	data['subType'] = entity.subType;
	return data;
}