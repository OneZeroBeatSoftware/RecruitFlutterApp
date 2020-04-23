import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class CompanyDetailEntity with JsonConvert<CompanyDetailEntity> {
	int statusCode;
	String msg;
	CompanyDetailData data;
}

class CompanyDetailData with JsonConvert<CompanyDetailData> {
	CompanyDetailDataCompany company;
	String starId;
	List<CompanyDetailDataIndustry> industries;
	List<CompanyDetailDataDetail> details;
	List<CompanyDetailDataWelfare> welfare;
	List<CompanyDetailDataTag> tags;
}

class CompanyDetailDataCompany with JsonConvert<CompanyDetailDataCompany> {
	String id;
	String companyName;
	String companySummary;
	String startDate;
	String endDate;
	String legalPerson;
	String registerCapital;
	String registerDate;
	String registerAddress;
	String unifiedCreditCode;
	String avatar;
	String managementId;
	String managementName;
	String scaleId;
	String scaleName;
	String scope;
	String industryId;
	String industryName;
	int state;
	String cityId;
	String cityName;
}

class CompanyDetailDataIndustry with JsonConvert<CompanyDetailDataIndustry> {
	String id;
	String industryName;
	int state;
	String pid;
}

class CompanyDetailDataDetail with JsonConvert<CompanyDetailDataDetail> {
	String id;
	String companyId;
	String detailsName;
	String content;
	int state;
}

class CompanyDetailDataWelfare with JsonConvert<CompanyDetailDataWelfare> {
	String id;
	String companyId;
	String welfareName;
	String content;
	int state;
}

class CompanyDetailDataTag with JsonConvert<CompanyDetailDataTag> {
	String id;
	String companyId;
	String tagName;
	int state;
}
