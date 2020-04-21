import 'package:recruit_app/entity/banner_entity.dart';

bannerEntityFromJson(BannerEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<BannerData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new BannerData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> bannerEntityToJson(BannerEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

bannerDataFromJson(BannerData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['actionType'] != null) {
		data.actionType = json['actionType']?.toInt();
	}
	if (json['actionValue'] != null) {
		data.actionValue = json['actionValue']?.toString();
	}
	if (json['visible'] != null) {
		data.visible = json['visible']?.toInt();
	}
	if (json['rank'] != null) {
		data.rank = json['rank']?.toInt();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	return data;
}

Map<String, dynamic> bannerDataToJson(BannerData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['desc'] = entity.desc;
	data['image'] = entity.image;
	data['url'] = entity.url;
	data['actionType'] = entity.actionType;
	data['actionValue'] = entity.actionValue;
	data['visible'] = entity.visible;
	data['rank'] = entity.rank;
	data['state'] = entity.state;
	return data;
}