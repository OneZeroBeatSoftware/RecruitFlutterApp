import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class JobTypeEntity with JsonConvert<JobTypeEntity> {
	int statusCode;
	String msg;
	List<JobTypeData> data;
}

class JobTypeData with JsonConvert<JobTypeData> {
	String type;
	bool isChecked;
	List<String> subType;
}
