import 'package:recruit_app/entity/collection_entity.dart';

collectionEntityFromJson(CollectionEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = json['data']?.toString();
	}
	return data;
}

Map<String, dynamic> collectionEntityToJson(CollectionEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	data['data'] = entity.data;
	return data;
}