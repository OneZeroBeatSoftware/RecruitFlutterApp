import 'package:recruit_app/entity/seeker_notice_entity.dart';

seekerNoticeEntityFromJson(SeekerNoticeEntity data, Map<String, dynamic> json) {
	if (json['statusCode'] != null) {
		data.statusCode = json['statusCode']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new SeekerNoticeData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> seekerNoticeEntityToJson(SeekerNoticeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['statusCode'] = entity.statusCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

seekerNoticeDataFromJson(SeekerNoticeData data, Map<String, dynamic> json) {
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
		data.records = new List<SeekerNoticeDataRecord>();
		(json['records'] as List).forEach((v) {
			data.records.add(new SeekerNoticeDataRecord().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> seekerNoticeDataToJson(SeekerNoticeData entity) {
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

seekerNoticeDataRecordFromJson(SeekerNoticeDataRecord data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['noticeName'] != null) {
		data.noticeName = json['noticeName']?.toString();
	}
	if (json['noticeSummary'] != null) {
		data.noticeSummary = json['noticeSummary']?.toString();
	}
	if (json['noticeType'] != null) {
		data.noticeType = json['noticeType']?.toInt();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['createDate'] != null) {
		data.createDate = json['createDate']?.toInt();
	}
	return data;
}

Map<String, dynamic> seekerNoticeDataRecordToJson(SeekerNoticeDataRecord entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['noticeName'] = entity.noticeName;
	data['noticeSummary'] = entity.noticeSummary;
	data['noticeType'] = entity.noticeType;
	data['content'] = entity.content;
	data['state'] = entity.state;
	data['createDate'] = entity.createDate;
	return data;
}