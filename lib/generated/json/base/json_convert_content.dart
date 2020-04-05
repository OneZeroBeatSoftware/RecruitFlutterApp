// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:recruit_app/entity/job_type_entity.dart';
import 'package:recruit_app/generated/json/job_type_entity_helper.dart';
import 'package:recruit_app/entity/company_detail_entity.dart';
import 'package:recruit_app/generated/json/company_detail_entity_helper.dart';
import 'package:recruit_app/entity/city_entity.dart';
import 'package:recruit_app/generated/json/city_entity_helper.dart';
import 'package:recruit_app/entity/job_detail_entity.dart';
import 'package:recruit_app/generated/json/job_detail_entity_helper.dart';
import 'package:recruit_app/entity/user_entity.dart';
import 'package:recruit_app/generated/json/user_entity_helper.dart';
import 'package:recruit_app/entity/company_list_entity.dart';
import 'package:recruit_app/generated/json/company_list_entity_helper.dart';
import 'package:recruit_app/entity/work_date_entity.dart';
import 'package:recruit_app/generated/json/work_date_entity_helper.dart';
import 'package:recruit_app/entity/job_list_entity.dart';
import 'package:recruit_app/generated/json/job_list_entity_helper.dart';
import 'package:recruit_app/entity/base_resp_entity.dart';
import 'package:recruit_app/generated/json/base_resp_entity_helper.dart';
import 'package:recruit_app/entity/company_scale_entity.dart';
import 'package:recruit_app/generated/json/company_scale_entity_helper.dart';
import 'package:recruit_app/entity/seeker_interview_entity.dart';
import 'package:recruit_app/generated/json/seeker_interview_entity_helper.dart';
import 'package:recruit_app/entity/edu_level_entity.dart';
import 'package:recruit_app/generated/json/edu_level_entity_helper.dart';
import 'package:recruit_app/entity/file_upload_entity.dart';
import 'package:recruit_app/generated/json/file_upload_entity_helper.dart';
import 'package:recruit_app/entity/salary_list_entity.dart';
import 'package:recruit_app/generated/json/salary_list_entity_helper.dart';
import 'package:recruit_app/entity/company_job_entity.dart';
import 'package:recruit_app/generated/json/company_job_entity_helper.dart';
import 'package:recruit_app/entity/industry_type_entity.dart';
import 'package:recruit_app/generated/json/industry_type_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case JobTypeEntity:
			return jobTypeEntityFromJson(data as JobTypeEntity, json) as T;			case JobTypeData:
			return jobTypeDataFromJson(data as JobTypeData, json) as T;			case CompanyDetailEntity:
			return companyDetailEntityFromJson(data as CompanyDetailEntity, json) as T;			case CompanyDetailData:
			return companyDetailDataFromJson(data as CompanyDetailData, json) as T;			case CompanyDetailDataCompany:
			return companyDetailDataCompanyFromJson(data as CompanyDetailDataCompany, json) as T;			case CompanyDetailDataIndustry:
			return companyDetailDataIndustryFromJson(data as CompanyDetailDataIndustry, json) as T;			case CompanyDetailDataDetail:
			return companyDetailDataDetailFromJson(data as CompanyDetailDataDetail, json) as T;			case CompanyDetailDataWelfare:
			return companyDetailDataWelfareFromJson(data as CompanyDetailDataWelfare, json) as T;			case CompanyDetailDataTag:
			return companyDetailDataTagFromJson(data as CompanyDetailDataTag, json) as T;			case CityEntity:
			return cityEntityFromJson(data as CityEntity, json) as T;			case CityData:
			return cityDataFromJson(data as CityData, json) as T;			case CityDataCity:
			return cityDataCityFromJson(data as CityDataCity, json) as T;			case JobDetailEntity:
			return jobDetailEntityFromJson(data as JobDetailEntity, json) as T;			case JobDetailData:
			return jobDetailDataFromJson(data as JobDetailData, json) as T;			case JobDetailDataJob:
			return jobDetailDataJobFromJson(data as JobDetailDataJob, json) as T;			case JobDetailDataIndustry:
			return jobDetailDataIndustryFromJson(data as JobDetailDataIndustry, json) as T;			case JobDetailDataPosition:
			return jobDetailDataPositionFromJson(data as JobDetailDataPosition, json) as T;			case JobDetailDataTreatments:
			return jobDetailDataTreatmentsFromJson(data as JobDetailDataTreatments, json) as T;			case JobDetailDataTags:
			return jobDetailDataTagsFromJson(data as JobDetailDataTags, json) as T;			case UserEntity:
			return userEntityFromJson(data as UserEntity, json) as T;			case UserData:
			return userDataFromJson(data as UserData, json) as T;			case CompanyListEntity:
			return companyListEntityFromJson(data as CompanyListEntity, json) as T;			case CompanyListData:
			return companyListDataFromJson(data as CompanyListData, json) as T;			case CompanyListDataRecord:
			return companyListDataRecordFromJson(data as CompanyListDataRecord, json) as T;			case CompanyListDataRecordsJobInfo:
			return companyListDataRecordsJobInfoFromJson(data as CompanyListDataRecordsJobInfo, json) as T;			case WorkDateEntity:
			return workDateEntityFromJson(data as WorkDateEntity, json) as T;			case WorkDateData:
			return workDateDataFromJson(data as WorkDateData, json) as T;			case JobListEntity:
			return jobListEntityFromJson(data as JobListEntity, json) as T;			case JobListData:
			return jobListDataFromJson(data as JobListData, json) as T;			case JobListDataRecord:
			return jobListDataRecordFromJson(data as JobListDataRecord, json) as T;			case JobListDataTreatments:
			return jobListDataTreatmentsFromJson(data as JobListDataTreatments, json) as T;			case BaseRespEntity:
			return baseRespEntityFromJson(data as BaseRespEntity, json) as T;			case CompanyScaleEntity:
			return companyScaleEntityFromJson(data as CompanyScaleEntity, json) as T;			case CompanyScaleData:
			return companyScaleDataFromJson(data as CompanyScaleData, json) as T;			case SeekerInterviewEntity:
			return seekerInterviewEntityFromJson(data as SeekerInterviewEntity, json) as T;			case SeekerInterviewData:
			return seekerInterviewDataFromJson(data as SeekerInterviewData, json) as T;			case SeekerInterviewDataRecord:
			return seekerInterviewDataRecordFromJson(data as SeekerInterviewDataRecord, json) as T;			case EduLevelEntity:
			return eduLevelEntityFromJson(data as EduLevelEntity, json) as T;			case EduLevelData:
			return eduLevelDataFromJson(data as EduLevelData, json) as T;			case FileUploadEntity:
			return fileUploadEntityFromJson(data as FileUploadEntity, json) as T;			case SalaryListEntity:
			return salaryListEntityFromJson(data as SalaryListEntity, json) as T;			case SalaryListData:
			return salaryListDataFromJson(data as SalaryListData, json) as T;			case CompanyJobEntity:
			return companyJobEntityFromJson(data as CompanyJobEntity, json) as T;			case CompanyJobData:
			return companyJobDataFromJson(data as CompanyJobData, json) as T;			case CompanyJobDataRecord:
			return companyJobDataRecordFromJson(data as CompanyJobDataRecord, json) as T;			case IndustryTypeEntity:
			return industryTypeEntityFromJson(data as IndustryTypeEntity, json) as T;			case IndustryTypeData:
			return industryTypeDataFromJson(data as IndustryTypeData, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case JobTypeEntity:
			return jobTypeEntityToJson(data as JobTypeEntity);			case JobTypeData:
			return jobTypeDataToJson(data as JobTypeData);			case CompanyDetailEntity:
			return companyDetailEntityToJson(data as CompanyDetailEntity);			case CompanyDetailData:
			return companyDetailDataToJson(data as CompanyDetailData);			case CompanyDetailDataCompany:
			return companyDetailDataCompanyToJson(data as CompanyDetailDataCompany);			case CompanyDetailDataIndustry:
			return companyDetailDataIndustryToJson(data as CompanyDetailDataIndustry);			case CompanyDetailDataDetail:
			return companyDetailDataDetailToJson(data as CompanyDetailDataDetail);			case CompanyDetailDataWelfare:
			return companyDetailDataWelfareToJson(data as CompanyDetailDataWelfare);			case CompanyDetailDataTag:
			return companyDetailDataTagToJson(data as CompanyDetailDataTag);			case CityEntity:
			return cityEntityToJson(data as CityEntity);			case CityData:
			return cityDataToJson(data as CityData);			case CityDataCity:
			return cityDataCityToJson(data as CityDataCity);			case JobDetailEntity:
			return jobDetailEntityToJson(data as JobDetailEntity);			case JobDetailData:
			return jobDetailDataToJson(data as JobDetailData);			case JobDetailDataJob:
			return jobDetailDataJobToJson(data as JobDetailDataJob);			case JobDetailDataIndustry:
			return jobDetailDataIndustryToJson(data as JobDetailDataIndustry);			case JobDetailDataPosition:
			return jobDetailDataPositionToJson(data as JobDetailDataPosition);			case JobDetailDataTreatments:
			return jobDetailDataTreatmentsToJson(data as JobDetailDataTreatments);			case JobDetailDataTags:
			return jobDetailDataTagsToJson(data as JobDetailDataTags);			case UserEntity:
			return userEntityToJson(data as UserEntity);			case UserData:
			return userDataToJson(data as UserData);			case CompanyListEntity:
			return companyListEntityToJson(data as CompanyListEntity);			case CompanyListData:
			return companyListDataToJson(data as CompanyListData);			case CompanyListDataRecord:
			return companyListDataRecordToJson(data as CompanyListDataRecord);			case CompanyListDataRecordsJobInfo:
			return companyListDataRecordsJobInfoToJson(data as CompanyListDataRecordsJobInfo);			case WorkDateEntity:
			return workDateEntityToJson(data as WorkDateEntity);			case WorkDateData:
			return workDateDataToJson(data as WorkDateData);			case JobListEntity:
			return jobListEntityToJson(data as JobListEntity);			case JobListData:
			return jobListDataToJson(data as JobListData);			case JobListDataRecord:
			return jobListDataRecordToJson(data as JobListDataRecord);			case JobListDataTreatments:
			return jobListDataTreatmentsToJson(data as JobListDataTreatments);			case BaseRespEntity:
			return baseRespEntityToJson(data as BaseRespEntity);			case CompanyScaleEntity:
			return companyScaleEntityToJson(data as CompanyScaleEntity);			case CompanyScaleData:
			return companyScaleDataToJson(data as CompanyScaleData);			case SeekerInterviewEntity:
			return seekerInterviewEntityToJson(data as SeekerInterviewEntity);			case SeekerInterviewData:
			return seekerInterviewDataToJson(data as SeekerInterviewData);			case SeekerInterviewDataRecord:
			return seekerInterviewDataRecordToJson(data as SeekerInterviewDataRecord);			case EduLevelEntity:
			return eduLevelEntityToJson(data as EduLevelEntity);			case EduLevelData:
			return eduLevelDataToJson(data as EduLevelData);			case FileUploadEntity:
			return fileUploadEntityToJson(data as FileUploadEntity);			case SalaryListEntity:
			return salaryListEntityToJson(data as SalaryListEntity);			case SalaryListData:
			return salaryListDataToJson(data as SalaryListData);			case CompanyJobEntity:
			return companyJobEntityToJson(data as CompanyJobEntity);			case CompanyJobData:
			return companyJobDataToJson(data as CompanyJobData);			case CompanyJobDataRecord:
			return companyJobDataRecordToJson(data as CompanyJobDataRecord);			case IndustryTypeEntity:
			return industryTypeEntityToJson(data as IndustryTypeEntity);			case IndustryTypeData:
			return industryTypeDataToJson(data as IndustryTypeData);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'JobTypeEntity':
			return JobTypeEntity().fromJson(json);			case 'JobTypeData':
			return JobTypeData().fromJson(json);			case 'CompanyDetailEntity':
			return CompanyDetailEntity().fromJson(json);			case 'CompanyDetailData':
			return CompanyDetailData().fromJson(json);			case 'CompanyDetailDataCompany':
			return CompanyDetailDataCompany().fromJson(json);			case 'CompanyDetailDataIndustry':
			return CompanyDetailDataIndustry().fromJson(json);			case 'CompanyDetailDataDetail':
			return CompanyDetailDataDetail().fromJson(json);			case 'CompanyDetailDataWelfare':
			return CompanyDetailDataWelfare().fromJson(json);			case 'CompanyDetailDataTag':
			return CompanyDetailDataTag().fromJson(json);			case 'CityEntity':
			return CityEntity().fromJson(json);			case 'CityData':
			return CityData().fromJson(json);			case 'CityDataCity':
			return CityDataCity().fromJson(json);			case 'JobDetailEntity':
			return JobDetailEntity().fromJson(json);			case 'JobDetailData':
			return JobDetailData().fromJson(json);			case 'JobDetailDataJob':
			return JobDetailDataJob().fromJson(json);			case 'JobDetailDataIndustry':
			return JobDetailDataIndustry().fromJson(json);			case 'JobDetailDataPosition':
			return JobDetailDataPosition().fromJson(json);			case 'JobDetailDataTreatments':
			return JobDetailDataTreatments().fromJson(json);			case 'JobDetailDataTags':
			return JobDetailDataTags().fromJson(json);			case 'UserEntity':
			return UserEntity().fromJson(json);			case 'UserData':
			return UserData().fromJson(json);			case 'CompanyListEntity':
			return CompanyListEntity().fromJson(json);			case 'CompanyListData':
			return CompanyListData().fromJson(json);			case 'CompanyListDataRecord':
			return CompanyListDataRecord().fromJson(json);			case 'CompanyListDataRecordsJobInfo':
			return CompanyListDataRecordsJobInfo().fromJson(json);			case 'WorkDateEntity':
			return WorkDateEntity().fromJson(json);			case 'WorkDateData':
			return WorkDateData().fromJson(json);			case 'JobListEntity':
			return JobListEntity().fromJson(json);			case 'JobListData':
			return JobListData().fromJson(json);			case 'JobListDataRecord':
			return JobListDataRecord().fromJson(json);			case 'JobListDataTreatments':
			return JobListDataTreatments().fromJson(json);			case 'BaseRespEntity':
			return BaseRespEntity().fromJson(json);			case 'CompanyScaleEntity':
			return CompanyScaleEntity().fromJson(json);			case 'CompanyScaleData':
			return CompanyScaleData().fromJson(json);			case 'SeekerInterviewEntity':
			return SeekerInterviewEntity().fromJson(json);			case 'SeekerInterviewData':
			return SeekerInterviewData().fromJson(json);			case 'SeekerInterviewDataRecord':
			return SeekerInterviewDataRecord().fromJson(json);			case 'EduLevelEntity':
			return EduLevelEntity().fromJson(json);			case 'EduLevelData':
			return EduLevelData().fromJson(json);			case 'FileUploadEntity':
			return FileUploadEntity().fromJson(json);			case 'SalaryListEntity':
			return SalaryListEntity().fromJson(json);			case 'SalaryListData':
			return SalaryListData().fromJson(json);			case 'CompanyJobEntity':
			return CompanyJobEntity().fromJson(json);			case 'CompanyJobData':
			return CompanyJobData().fromJson(json);			case 'CompanyJobDataRecord':
			return CompanyJobDataRecord().fromJson(json);			case 'IndustryTypeEntity':
			return IndustryTypeEntity().fromJson(json);			case 'IndustryTypeData':
			return IndustryTypeData().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'JobTypeEntity':
			return List<JobTypeEntity>();			case 'JobTypeData':
			return List<JobTypeData>();			case 'CompanyDetailEntity':
			return List<CompanyDetailEntity>();			case 'CompanyDetailData':
			return List<CompanyDetailData>();			case 'CompanyDetailDataCompany':
			return List<CompanyDetailDataCompany>();			case 'CompanyDetailDataIndustry':
			return List<CompanyDetailDataIndustry>();			case 'CompanyDetailDataDetail':
			return List<CompanyDetailDataDetail>();			case 'CompanyDetailDataWelfare':
			return List<CompanyDetailDataWelfare>();			case 'CompanyDetailDataTag':
			return List<CompanyDetailDataTag>();			case 'CityEntity':
			return List<CityEntity>();			case 'CityData':
			return List<CityData>();			case 'CityDataCity':
			return List<CityDataCity>();			case 'JobDetailEntity':
			return List<JobDetailEntity>();			case 'JobDetailData':
			return List<JobDetailData>();			case 'JobDetailDataJob':
			return List<JobDetailDataJob>();			case 'JobDetailDataIndustry':
			return List<JobDetailDataIndustry>();			case 'JobDetailDataPosition':
			return List<JobDetailDataPosition>();			case 'JobDetailDataTreatments':
			return List<JobDetailDataTreatments>();			case 'JobDetailDataTags':
			return List<JobDetailDataTags>();			case 'UserEntity':
			return List<UserEntity>();			case 'UserData':
			return List<UserData>();			case 'CompanyListEntity':
			return List<CompanyListEntity>();			case 'CompanyListData':
			return List<CompanyListData>();			case 'CompanyListDataRecord':
			return List<CompanyListDataRecord>();			case 'CompanyListDataRecordsJobInfo':
			return List<CompanyListDataRecordsJobInfo>();			case 'WorkDateEntity':
			return List<WorkDateEntity>();			case 'WorkDateData':
			return List<WorkDateData>();			case 'JobListEntity':
			return List<JobListEntity>();			case 'JobListData':
			return List<JobListData>();			case 'JobListDataRecord':
			return List<JobListDataRecord>();			case 'JobListDataTreatments':
			return List<JobListDataTreatments>();			case 'BaseRespEntity':
			return List<BaseRespEntity>();			case 'CompanyScaleEntity':
			return List<CompanyScaleEntity>();			case 'CompanyScaleData':
			return List<CompanyScaleData>();			case 'SeekerInterviewEntity':
			return List<SeekerInterviewEntity>();			case 'SeekerInterviewData':
			return List<SeekerInterviewData>();			case 'SeekerInterviewDataRecord':
			return List<SeekerInterviewDataRecord>();			case 'EduLevelEntity':
			return List<EduLevelEntity>();			case 'EduLevelData':
			return List<EduLevelData>();			case 'FileUploadEntity':
			return List<FileUploadEntity>();			case 'SalaryListEntity':
			return List<SalaryListEntity>();			case 'SalaryListData':
			return List<SalaryListData>();			case 'CompanyJobEntity':
			return List<CompanyJobEntity>();			case 'CompanyJobData':
			return List<CompanyJobData>();			case 'CompanyJobDataRecord':
			return List<CompanyJobDataRecord>();			case 'IndustryTypeEntity':
			return List<IndustryTypeEntity>();			case 'IndustryTypeData':
			return List<IndustryTypeData>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}