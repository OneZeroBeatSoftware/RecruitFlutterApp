import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class AgeEntity with JsonConvert<AgeEntity> {
	int statusCode;
	String msg;
	List<AgeData> data;
}

class AgeData with JsonConvert<AgeData> {
	String id;
	int minAge;
	int maxAge;
	int state;
}
