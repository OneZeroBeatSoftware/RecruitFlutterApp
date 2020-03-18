import 'package:recruit_app/entity/city_entity.dart';

cityEntityFromJson(CityEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<CityData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new CityData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> cityEntityToJson(CityEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

cityDataFromJson(CityData data, Map<String, dynamic> json) {
	if (json['initial'] != null) {
		data.initial = json['initial']?.toString();
	}
	if (json['cities'] != null) {
		data.cities = new List<CityDataCity>();
		(json['cities'] as List).forEach((v) {
			data.cities.add(new CityDataCity().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> cityDataToJson(CityData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['initial'] = entity.initial;
	if (entity.cities != null) {
		data['cities'] =  entity.cities.map((v) => v.toJson()).toList();
	}
	return data;
}

cityDataCityFromJson(CityDataCity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['cityName'] != null) {
		data.cityName = json['cityName']?.toString();
	}
	if (json['phonetic'] != null) {
		data.phonetic = json['phonetic']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toString();
	}
	if (json['pid'] != null) {
		data.pid = json['pid']?.toString();
	}
	return data;
}

Map<String, dynamic> cityDataCityToJson(CityDataCity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['cityName'] = entity.cityName;
	data['phonetic'] = entity.phonetic;
	data['state'] = entity.state;
	data['pid'] = entity.pid;
	return data;
}