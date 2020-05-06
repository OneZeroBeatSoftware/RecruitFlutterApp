import 'package:recruit_app/entity/job_list_data_record_entity.dart';
import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class StarJobEntity with JsonConvert<StarJobEntity> {
	int statusCode;
	String msg;
	StarJobData data;
}

class StarJobData with JsonConvert<StarJobData> {
	int total;
	int size;
	int pages;
	int current;
	List<JobListDataRecord> records;
}
