import 'package:recruit_app/generated/json/base/json_convert_content.dart';

import 'company_item_entity.dart';

class CompanyListEntity with JsonConvert<CompanyListEntity> {
	int statusCode;
	String msg;
	CompanyListData data;
}
