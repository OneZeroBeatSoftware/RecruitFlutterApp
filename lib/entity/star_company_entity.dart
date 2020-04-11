import 'package:recruit_app/entity/company_item_entity.dart';
import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class StarCompanyEntity with JsonConvert<StarCompanyEntity> {
	int statusCode;
	String msg;
	StarCompanyData data;
}

class StarCompanyData with JsonConvert<StarCompanyData> {
	int total;
	int size;
	int pages;
	int current;
	List<CompanyListDataRecord> records;
}
