import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class SeekerNoticeEntity with JsonConvert<SeekerNoticeEntity> {
	int statusCode;
	String msg;
	SeekerNoticeData data;
}

class SeekerNoticeData with JsonConvert<SeekerNoticeData> {
	int total;
	int size;
	int pages;
	int current;
	List<SeekerNoticeDataRecord> records;
}

class SeekerNoticeDataRecord with JsonConvert<SeekerNoticeDataRecord> {
	String id;
	String noticeName;
	String noticeSummary;
	int noticeType;
	String content;
	int state;
	int createDate;
}
