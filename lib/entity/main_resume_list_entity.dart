import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class MainResumeListEntity with JsonConvert<MainResumeListEntity> {
	int statusCode;
	String msg;
	MainResumeListData data;
}

class MainResumeListData with JsonConvert<MainResumeListData> {
	int total;
	int size;
	int pages;
	int current;
	List<MainResumeListDataRecord> records;
}

class MainResumeListDataRecord with JsonConvert<MainResumeListDataRecord> {
	String id;
	String starId;
	String shieldId;
	String jobSeekerId;
	String realName;
	String resumeName;
	int sex;
	String workDateName;
	int minSalary;
	int maxSalary;
	String educationName;
}
