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
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['isChecked'] != null) {
		data.isChecked = json['isChecked'];
	}
	if (json['subType'] != null) {
		data.subType = new List<IndustrySubTypeData>();
		(json['subType'] as List).forEach((v) {
			data.subType.add(new IndustrySubTypeData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> industryTypeDataToJson(IndustryTypeData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['type'] = entity.type;
	data['isChecked'] = entity.isChecked;
	if (entity.subType != null) {
		data['subType'] =  entity.subType.map((v) => v.toJson()).toList();
	}
	return data;
}

industrySubTypeDataFromJson(IndustrySubTypeData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['subType'] != null) {
		data.subType = json['subType']?.toString();
	}
	if (json['isChecked'] != null) {
		data.isChecked = json['isChecked'];
	}
	return data;
}

Map<String, dynamic> industrySubTypeDataToJson(IndustrySubTypeData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['subType'] = entity.subType;
	data['isChecked'] = entity.isChecked;
	return data;
}