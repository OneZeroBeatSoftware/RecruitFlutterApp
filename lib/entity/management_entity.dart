import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class ManagementEntity with JsonConvert<ManagementEntity> {
	int statusCode;
	String msg;
	List<ManagementData> data;
}

class ManagementData with JsonConvert<ManagementData> {
	String id;
	String managementName;
}
