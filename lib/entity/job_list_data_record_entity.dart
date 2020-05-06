import 'package:recruit_app/generated/json/base/json_convert_content.dart';

class JobListDataRecord with JsonConvert<JobListDataRecord> {
  String id;
  String starId;
  String companyId;
  String companyName;
  String jobName;
  String workAddress;
  String avatar;
  double minSalary;
  double maxSalary;
  int releaseDate;
  int city;
  String educationId;
  String educationName;
  int workDateId;
  String workDateName;
  int candidatesTotal;
  int candidatesCurrent;
  List<JobListDataTreatments> treatments;
}

class JobListDataTreatments with JsonConvert<JobListDataTreatments> {
  String id;
  String treatmentName;
  String content;
  String state;
}