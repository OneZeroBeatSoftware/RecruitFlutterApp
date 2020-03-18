import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class CompanyDetailEntity with JsonConvert<CompanyDetailEntity> {
	int statusCode;
	String msg;
	CompanyDetailData data;
}

class CompanyDetailData with JsonConvert<CompanyDetailData> {
	CompanyDetailDataCompany company;
	String scale;
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
	double registerCapital;
	int registerDate;
	String operateState;
	String registerAddress;
	String unifiedCreditCode;
	int companyScale;
	String scope;
	String industryId;
	int state;
	int city;
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
