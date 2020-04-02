import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class CompanyScaleEntity with JsonConvert<CompanyScaleEntity> {
	int statusCode;
	String msg;
	List<CompanyScaleData> data;
}

class CompanyScaleData with JsonConvert<CompanyScaleData> {
	String id;
	String scaleName;
	int state;
}
