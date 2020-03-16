import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class WorkDateEntity with JsonConvert<WorkDateEntity> {
	int statusCode;
	String msg;
	List<WorkDateData> data;
}

class WorkDateData with JsonConvert<WorkDateData> {
	String id;
	String workDateName;
	int state;
}
