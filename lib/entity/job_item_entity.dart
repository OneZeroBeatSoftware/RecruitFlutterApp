import 'package:recruit_app/entity/job_list_data_record_entity.dart';
import 'package:recruit_app/generated/json/base/json_convert_content.dart';
class JobListData with JsonConvert<JobListData> {
	int total;
	int size;
	int pages;
	int current;
	List<JobListDataRecord> records;
}
