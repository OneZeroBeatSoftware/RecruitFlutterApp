import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class JobPositionTypeEntity with JsonConvert<JobPositionTypeEntity> {
	int statusCode;
	String msg;
	List<JobPositionTypeData> data;
}

class JobPositionTypeData with JsonConvert<JobPositionTypeData> {
	String id;
	String name;
}
