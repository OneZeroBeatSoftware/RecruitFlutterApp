import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class IndustryTypeEntity with JsonConvert<IndustryTypeEntity> {
	int statusCode;
	String msg;
	List<IndustryTypeData> data;
}

class IndustryTypeData with JsonConvert<IndustryTypeData> {
	String id;
	String type;
	bool isChecked;
	List<IndustrySubTypeData> subType;
}

class IndustrySubTypeData with JsonConvert<IndustrySubTypeData> {
	String id;
	String subType;
	bool isChecked;
}