import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class MineInfoEntity with JsonConvert<MineInfoEntity> {
	int statusCode;
	String msg;
	MineInfoData data;
}

class MineInfoData with JsonConvert<MineInfoData> {
	MineInfoDataJobSeeker jobSeeker;
	int applyCount1;
	int applyCount2;
	int applyCount3;
}

class MineInfoDataJobSeeker with JsonConvert<MineInfoDataJobSeeker> {
	String id;
	String userId;
	String realName;
	int jobIntentionTotal;
	int jobIntentionCurrent;
	int resumeTotal;
	int resumeCurrent;
}
