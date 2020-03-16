// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:recruit_app/entity/job_detail_entity.dart';
import 'package:recruit_app/generated/json/job_detail_entity_helper.dart';
import 'package:recruit_app/entity/user_entity.dart';
import 'package:recruit_app/generated/json/user_entity_helper.dart';
import 'package:recruit_app/entity/work_date_entity.dart';
import 'package:recruit_app/generated/json/work_date_entity_helper.dart';
import 'package:recruit_app/entity/job_list_entity.dart';
import 'package:recruit_app/generated/json/job_list_entity_helper.dart';
import 'package:recruit_app/entity/edu_level_entity.dart';
import 'package:recruit_app/generated/json/edu_level_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case JobDetailEntity:
			return jobDetailEntityFromJson(data as JobDetailEntity, json) as T;			case JobDetailData:
			return jobDetailDataFromJson(data as JobDetailData, json) as T;			case JobDetailDataJob:
			return jobDetailDataJobFromJson(data as JobDetailDataJob, json) as T;			case JobDetailDataIndustry:
			return jobDetailDataIndustryFromJson(data as JobDetailDataIndustry, json) as T;			case JobDetailDataPosition:
			return jobDetailDataPositionFromJson(data as JobDetailDataPosition, json) as T;			case JobDetailDataTreatments:
			return jobDetailDataTreatmentsFromJson(data as JobDetailDataTreatments, json) as T;			case JobDetailDataTags:
			return jobDetailDataTagsFromJson(data as JobDetailDataTags, json) as T;			case UserEntity:
			return userEntityFromJson(data as UserEntity, json) as T;			case WorkDateEntity:
			return workDateEntityFromJson(data as WorkDateEntity, json) as T;			case WorkDateData:
			return workDateDataFromJson(data as WorkDateData, json) as T;			case JobListEntity:
			return jobListEntityFromJson(data as JobListEntity, json) as T;			case JobListData:
			return jobListDataFromJson(data as JobListData, json) as T;			case JobListDataRecord:
			return jobListDataRecordFromJson(data as JobListDataRecord, json) as T;			case JobListDataTreatments:
			return jobListDataTreatmentsFromJson(data as JobListDataTreatments, json) as T;			case EduLevelEntity:
			return eduLevelEntityFromJson(data as EduLevelEntity, json) as T;			case EduLevelData:
			return eduLevelDataFromJson(data as EduLevelData, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case JobDetailEntity:
			return jobDetailEntityToJson(data as JobDetailEntity);			case JobDetailData:
			return jobDetailDataToJson(data as JobDetailData);			case JobDetailDataJob:
			return jobDetailDataJobToJson(data as JobDetailDataJob);			case JobDetailDataIndustry:
			return jobDetailDataIndustryToJson(data as JobDetailDataIndustry);			case JobDetailDataPosition:
			return jobDetailDataPositionToJson(data as JobDetailDataPosition);			case JobDetailDataTreatments:
			return jobDetailDataTreatmentsToJson(data as JobDetailDataTreatments);			case JobDetailDataTags:
			return jobDetailDataTagsToJson(data as JobDetailDataTags);			case UserEntity:
			return userEntityToJson(data as UserEntity);			case WorkDateEntity:
			return workDateEntityToJson(data as WorkDateEntity);			case WorkDateData:
			return workDateDataToJson(data as WorkDateData);			case JobListEntity:
			return jobListEntityToJson(data as JobListEntity);			case JobListData:
			return jobListDataToJson(data as JobListData);			case JobListDataRecord:
			return jobListDataRecordToJson(data as JobListDataRecord);			case JobListDataTreatments:
			return jobListDataTreatmentsToJson(data as JobListDataTreatments);			case EduLevelEntity:
			return eduLevelEntityToJson(data as EduLevelEntity);			case EduLevelData:
			return eduLevelDataToJson(data as EduLevelData);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'JobDetailEntity':
			return JobDetailEntity().fromJson(json);			case 'JobDetailData':
			return JobDetailData().fromJson(json);			case 'JobDetailDataJob':
			return JobDetailDataJob().fromJson(json);			case 'JobDetailDataIndustry':
			return JobDetailDataIndustry().fromJson(json);			case 'JobDetailDataPosition':
			return JobDetailDataPosition().fromJson(json);			case 'JobDetailDataTreatments':
			return JobDetailDataTreatments().fromJson(json);			case 'JobDetailDataTags':
			return JobDetailDataTags().fromJson(json);			case 'UserEntity':
			return UserEntity().fromJson(json);			case 'WorkDateEntity':
			return WorkDateEntity().fromJson(json);			case 'WorkDateData':
			return WorkDateData().fromJson(json);			case 'JobListEntity':
			return JobListEntity().fromJson(json);			case 'JobListData':
			return JobListData().fromJson(json);			case 'JobListDataRecord':
			return JobListDataRecord().fromJson(json);			case 'JobListDataTreatments':
			return JobListDataTreatments().fromJson(json);			case 'EduLevelEntity':
			return EduLevelEntity().fromJson(json);			case 'EduLevelData':
			return EduLevelData().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'JobDetailEntity':
			return List<JobDetailEntity>();			case 'JobDetailData':
			return List<JobDetailData>();			case 'JobDetailDataJob':
			return List<JobDetailDataJob>();			case 'JobDetailDataIndustry':
			return List<JobDetailDataIndustry>();			case 'JobDetailDataPosition':
			return List<JobDetailDataPosition>();			case 'JobDetailDataTreatments':
			return List<JobDetailDataTreatments>();			case 'JobDetailDataTags':
			return List<JobDetailDataTags>();			case 'UserEntity':
			return List<UserEntity>();			case 'WorkDateEntity':
			return List<WorkDateEntity>();			case 'WorkDateData':
			return List<WorkDateData>();			case 'JobListEntity':
			return List<JobListEntity>();			case 'JobListData':
			return List<JobListData>();			case 'JobListDataRecord':
			return List<JobListDataRecord>();			case 'JobListDataTreatments':
			return List<JobListDataTreatments>();			case 'EduLevelEntity':
			return List<EduLevelEntity>();			case 'EduLevelData':
			return List<EduLevelData>();    }
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