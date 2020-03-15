import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class EduLevelEntity with JsonConvert<EduLevelEntity> {
	int statusCode;
	String msg;
	List<EduLevelData> data;
}

class EduLevelData with JsonConvert<EduLevelData> {
	String id;
	String educationName;
	int state;
}
