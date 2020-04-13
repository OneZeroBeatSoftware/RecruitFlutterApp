import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class BossInfoEntity with JsonConvert<BossInfoEntity> {
	int statusCode;
	String msg;
	BossInfoData data;
}

class BossInfoData with JsonConvert<BossInfoData> {
	BossInfoDataRecruiter recruiter;
	int applyCount1;
	int applyCount2;
	int applyCount3;
}

class BossInfoDataRecruiter with JsonConvert<BossInfoDataRecruiter> {
	String id;
	String userId;
	String companyId;
	String realName;
}
