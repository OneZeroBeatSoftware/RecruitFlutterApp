import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class JobStateEntity with JsonConvert<JobStateEntity> {
	int statusCode;
	String msg;
	JobStateData data;
}

class JobStateData with JsonConvert<JobStateData> {
	int total;
	int size;
	int pages;
	int current;
	List<JobStateDataRecord> records;
}

class JobStateDataRecord with JsonConvert<JobStateDataRecord> {
	String id;
	String name;
}
