import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class ResumeListEntity with JsonConvert<ResumeListEntity> {
	int statusCode;
	String msg;
	List<ResumeListData> data;
}

class ResumeListData with JsonConvert<ResumeListData> {
	String id;
	String jobSeekerId;
	String resumeName;
	String realName;
	int sex;
	int birthDate;
	String address;
	int graduationDate;
	int education;
	String workDate;
	String minSalary;
	String maxSalary;
	String workExperienceId;
	String projectExperienceId;
	String educationExperienceId;
	int defaultResume;
	int state;
}
