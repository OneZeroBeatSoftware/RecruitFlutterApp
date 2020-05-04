import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class BlackListEntity with JsonConvert<BlackListEntity> {
	int statusCode;
	String msg;
	BlackListData data;
}

class BlackListData with JsonConvert<BlackListData> {
	int total;
	int size;
	int pages;
	int current;
	List<BlackListDataRecord> records;
}

class BlackListDataRecord with JsonConvert<BlackListDataRecord> {
	String id;
	String shieldId;
	String companyName;
	String registerAddress;
	String managementName;
	String avatar;
	String cityName;
	String scaleName;
	String industryName;
}
