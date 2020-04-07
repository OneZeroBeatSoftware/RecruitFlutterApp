import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class JobTypeEntity with JsonConvert<JobTypeEntity> {
	int statusCode;
	String msg;
	List<JobTypeData> data;
}

class JobTypeData with JsonConvert<JobTypeData> {
	String id;
	String type;
	bool isChecked;
	List<JobSubTypeData> subType;
}

class JobSubTypeData with JsonConvert<JobSubTypeData> {
	String id;
	String subType;
	bool isChecked;
}
