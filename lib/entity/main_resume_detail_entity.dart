import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class MainResumeDetailEntity with JsonConvert<MainResumeDetailEntity> {
	int statusCode;
	String msg;
	MainResumeDetailData data;
}

class MainResumeDetailData with JsonConvert<MainResumeDetailData> {
	MainResumeDetailDataResume resume;
	String age;
	String education;
	String workDate;
	List<MainResumeDetailDataWorkExperience> workExperience;
	List<MainResumeDetailDataProjectExperience> projectExperience;
	List<MainResumeDetailDataEducationExperience> educationExperience;
}

class MainResumeDetailDataResume with JsonConvert<MainResumeDetailDataResume> {
	String id;
	String jobSeekerId;
	String resumeName;
	String realName;
	int sex;
	int birthDate;
	String address;
	int graduationDate;
	int education;
	int workDate;
	int minSalary;
	int maxSalary;
	String workExperienceId;
	String projectExperienceId;
	String educationExperienceId;
	int defaultResume;
	int state;
}

class MainResumeDetailDataWorkExperience with JsonConvert<MainResumeDetailDataWorkExperience> {
	String id;
	String resumeId;
	String companyName;
	String position;
	String industry;
	String workContent;
	String department;
	int startDate;
	int endDate;
	int state;
}

class MainResumeDetailDataProjectExperience with JsonConvert<MainResumeDetailDataProjectExperience> {
	String id;
	String resumeId;
	String projectName;
	String position;
	String projectContent;
	int startDate;
	int endDate;
	int state;
}

class MainResumeDetailDataEducationExperience with JsonConvert<MainResumeDetailDataEducationExperience> {
	String id;
	String resumeId;
	String educationName;
	String specialty;
	int startDate;
	int endDate;
	int state;
}
