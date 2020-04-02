import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class SalaryListEntity with JsonConvert<SalaryListEntity> {
	int statusCode;
	String msg;
	List<SalaryListData> data;
}

class SalaryListData with JsonConvert<SalaryListData> {
	String id;
	String minSalary;
	String maxSalary;
	int state;
}
