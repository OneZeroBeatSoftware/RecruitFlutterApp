import 'package:recruit_app/entity/star_company_entity.dart';
import 'package:recruit_app/entity/company_item_entity.dart';

starCompanyEntityFromJson(StarCompanyEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new StarCompanyData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> starCompanyEntityToJson(StarCompanyEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

starCompanyDataFromJson(StarCompanyData data, Map<String, dynamic> json) {
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
		data.records = new List<CompanyListDataRecord>();
		(json['records'] as List).forEach((v) {
			data.records.add(new CompanyListDataRecord().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> starCompanyDataToJson(StarCompanyData entity) {
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