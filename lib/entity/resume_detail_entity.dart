import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class ResumeDetailEntity with JsonConvert<ResumeDetailEntity> {
	int statusCode;
	String msg;
	ResumeDetailData data;
}

class ResumeDetailData with JsonConvert<ResumeDetailData> {
	ResumeDetailDataResume resume;
	List<ResumeDetailDataCertificate> certificates;
	List<String> socialHomepage;
	List<ResumeDetailDataWorkExperience> workExperience;
	List<ResumeDetailDataProjectExperience> projectExperience;
	List<ResumeDetailDataEducationExperience> educationExperience;
}

class ResumeDetailDataResume with JsonConvert<ResumeDetailDataResume> {
	String id;
	String resumeName;
	String jobSeekerId;
	String avatar;
	String realName;
	int birthDate;
	int workExp;
	String age;
	int sex;
	String address;
	int graduationDate;
	String educationId;
	String educationName;
	String workDateId;
	String workDateName;
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
	String industryId;
	String positionId;
	String industryName;
	String positionName;
	int startDate;
	int endDate;
	String department;
	int state;
}

class ResumeDetailDataProjectExperience with JsonConvert<ResumeDetailDataProjectExperience> {
	String id;
	String resumeId;
	String projectName;
	String projectContent;
	String industryId;
	String industryName;
	int startDate;
	int endDate;
	int state;
}

class ResumeDetailDataEducationExperience with JsonConvert<ResumeDetailDataEducationExperience> {
	String id;
	String resumeId;
	String school;
	String educationId;
	String educationName;
	String specialty;
	int startDate;
	int endDate;
	int state;
}
