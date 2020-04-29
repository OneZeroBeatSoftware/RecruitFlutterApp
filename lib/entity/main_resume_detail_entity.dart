import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class MainResumeDetailEntity with JsonConvert<MainResumeDetailEntity> {
  int statusCode;
  String msg;
  MainResumeDetailData data;
}

class MainResumeDetailData with JsonConvert<MainResumeDetailData> {
  MainResumeDetailDataResume resume;
  String starId;
  List<MainResumeDetailDataWorkExperience> workExperience;
  List<MainResumeDetailDataProjectExperience> projectExperience;
  List<MainResumeDetailDataEducationExperience> educationExperience;
}

class MainResumeDetailDataResume with JsonConvert<MainResumeDetailDataResume> {
  String id;
  String jobSeekerId;
  String resumeName;
  String realName;
  String age;
  int sex;
  int workExp;
  int birthDate;
  String address;
  int graduationDate;
  int educationId;
  String educationName;
  int workDateId;
  String workDateName;
  int minSalary;
  int maxSalary;
  String workExperienceId;
  String projectExperienceId;
  String educationExperienceId;
  String socialHomepage;
  int defaultResume;
  int state;
}

class MainResumeDetailDataWorkExperience
    with JsonConvert<MainResumeDetailDataWorkExperience> {
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

class MainResumeDetailDataProjectExperience
    with JsonConvert<MainResumeDetailDataProjectExperience> {
  String id;
  String resumeId;
  String projectName;
  String position;
  String projectContent;
  int startDate;
  int endDate;
  int state;
}

class MainResumeDetailDataEducationExperience
    with JsonConvert<MainResumeDetailDataEducationExperience> {
  String id;
  String resumeId;
  String educationName;
  String specialty;
  int startDate;
  int endDate;
  int state;
}
