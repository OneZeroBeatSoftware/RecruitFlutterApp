import 'package:recruit_app/entity/company_item_entity.dart';
import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class CompanyListEntity with JsonConvert<CompanyListEntity> {
	int statusCode;
	String msg;
	CompanyListData data;
}
