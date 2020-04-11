import 'package:recruit_app/entity/company_list_entity.dart';
import 'package:recruit_app/entity/company_item_entity.dart';

companyListEntityFromJson(CompanyListEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new CompanyListData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> companyListEntityToJson(CompanyListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}