import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class ResumeListEntity with JsonConvert<ResumeListEntity> {
	int statusCode;
	String msg;
	List<ResumeListData> data;
}

class ResumeListData with JsonConvert<ResumeListData> {
	ResumeListDataResume resume;
	List<ResumeListDataCertificate> certificates;
	List<String> socialHomepage;
	List<ResumeListDataWorkExperience> workExperience;
	List<ResumeListDataProjectExperience> projectExperience;
	List<ResumeListDataEducationExperience> educationExperience;
}

class ResumeListDataResume with JsonConvert<ResumeListDataResume> {
	int id;
	int userId;
	String resumeName;
	int jobSeekerId;
	String realName;
	String avatar;
	int birthDate;
	int workExp;
	String age;
	int sex;
	String address;
	int graduationDate;
	int educationId;
	String educationName;
	int workDateId;
	String workDateName;
	double minSalary;
	double maxSalary;
	int defaultResume;
	int state;
	String phone;
	String socialHomepage;
}

class ResumeListDataCertificate with JsonConvert<ResumeListDataCertificate> {
	int id;
	String certificateName;
	int resumeId;
	int state;
}

class ResumeListDataWorkExperience with JsonConvert<ResumeListDataWorkExperience> {
	int id;
	int resumeId;
	String companyName;
	int industryId;
	int positionId;
	String industryName;
	String positionName;
	int startDate;
	int endDate;
	String department;
	int state;
}

class ResumeListDataProjectExperience with JsonConvert<ResumeListDataProjectExperience> {
	int id;
	String projectName;
	int resumeId;
	int industryId;
	String industryName;
	int startDate;
	int endDate;
	String projectContent;
	int state;
}

class ResumeListDataEducationExperience with JsonConvert<ResumeListDataEducationExperience> {
	int id;
	int resumeId;
	String school;
	int educationId;
	String educationName;
	String specialty;
	int startDate;
	int endDate;
	int state;
}
