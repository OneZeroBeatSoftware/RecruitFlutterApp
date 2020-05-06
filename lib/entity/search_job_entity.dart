import 'package:recruit_app/entity/job_list_data_record_entity.dart';
import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class SearchJobEntity with JsonConvert<SearchJobEntity> {
	int statusCode;
	String msg;
	List<JobListDataRecord> data;
}
