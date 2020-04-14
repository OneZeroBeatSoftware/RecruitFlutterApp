import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class BossApplyListEntity with JsonConvert<BossApplyListEntity> {
	int statusCode;
	String msg;
	BossApplyListData data;
}

class BossApplyListData with JsonConvert<BossApplyListData> {
	int total;
	int size;
	int pages;
	int current;
	List<BossApplyListDataRecord> records;
}

class BossApplyListDataRecord with JsonConvert<BossApplyListDataRecord> {
	String id;
	String resumeId;
	String resumeName;
	int sex;
	String minSalary;
	String maxSalary;
	String realName;
	String workDateName;
	String educationName;
	int state;
	int applyDate;
}
