import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class JobStateEntity with JsonConvert<JobStateEntity> {
	int statusCode;
	String msg;
	List<JobStateData> data;
}

class JobStateData with JsonConvert<JobStateData> {
	String id;
	String name;
	int state;
}
