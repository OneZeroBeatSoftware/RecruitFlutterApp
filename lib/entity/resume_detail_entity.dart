import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class ResumeDetailEntity with JsonConvert<ResumeDetailEntity> {
	int statusCode;
	String msg;
	ResumeDetailData data;
}

class ResumeDetailData with JsonConvert<ResumeDetailData> {
	ResumeDetailDataResume resume;
	String age;
	String education;
	String workDate;
	List<ResumeDetailDataCertificate> certificates;
	List<String> socialHomepage;
	List<ResumeDetailDataWorkExperience> workExperience;
	List<ResumeDetailDataProjectExperience> projectExperience;
	List<ResumeDetailDataEducationExperience> educationExperience;
}

class ResumeDetailDataResume with JsonConvert<ResumeDetailDataResume> {
	String id;
	String jobSeekerId;
	String resumeName;
	String realName;
	int sex;
	int birthDate;
	String address;
	int graduationDate;
	String education;
	String workDate;
	String minSalary;
	String maxSalary;
	String workExperienceId;
	String projectExperienceId;
	String educationExperienceId;
	int defaultResume;
	int state;
	String socialHomepage;
}

class ResumeDetailDataCertificate with JsonConvert<ResumeDetailDataCertificate> {
	String id;
	String certificateName;
	String resumeId;
	int state;
}

class ResumeDetailDataWorkExperience with JsonConvert<ResumeDetailDataWorkExperience> {
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

class ResumeDetailDataProjectExperience with JsonConvert<ResumeDetailDataProjectExperience> {
	String id;
	String resumeId;
	String projectName;
	String position;
	String projectContent;
	int startDate;
	int endDate;
	int state;
}

class ResumeDetailDataEducationExperience with JsonConvert<ResumeDetailDataEducationExperience> {
	String id;
	String resumeId;
	String educationName;
	String specialty;
	int startDate;
	int endDate;
	int state;
}
