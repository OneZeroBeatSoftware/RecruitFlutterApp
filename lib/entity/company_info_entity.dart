import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class CompanyInfoEntity with JsonConvert<CompanyInfoEntity> {
	int statusCode;
	String msg;
	CompanyInfoData data;
}

class CompanyInfoData with JsonConvert<CompanyInfoData> {
	String id;
	String companyName;
	String companySummary;
	String startDate;
	String endDate;
	String legalPerson;
	String registerCapital;
	int registerDate;
	String management;
	String registerAddress;
	String unifiedCreditCode;
	String avatar;
	String scale;
	String scope;
	String industry;
	String city;
}
