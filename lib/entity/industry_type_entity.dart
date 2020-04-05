import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class IndustryTypeEntity with JsonConvert<IndustryTypeEntity> {
	int statusCode;
	String msg;
	List<IndustryTypeData> data;
}

class IndustryTypeData with JsonConvert<IndustryTypeData> {
	String type;
	bool isChecked;
	List<String> subType;
}
