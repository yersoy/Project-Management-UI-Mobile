import 'dart:convert';

import 'package:cilekhavuz/models/Person.dart';

class ModuleTasks {
  int? tableId;
  int? primaryId;
  int? workStepId;
  String? description;
  List<Person>? personIds;
  List<Person>? contactIds;
  String? workStepName;
  String? deadlineStartDate;
  String? deadlineEndDate;
  String? startDate;
  String? endDate;
  String? realStartDate;
  String? realEndDate;
  int? taskProgress;
  int? orderNo;
  EventStatusValue? auditorApprovalEventStatus;
  EventStatusValue? contactApprovalEventStatus;
  String? ritmaDriveFolderId;
  List<Person>? auditorPersonIds;
  List<Person>? auditorContactIds;
  bool? isAuditorApprovalRequired;
  bool? isRelatedContactApprovalRequired;
  bool? isRequiredFile;
  bool? isRequiredImage;
  bool? isRequiredVideo;
  int? eventStatusId;
  String? eventStatusName;
  EventStatusValue? eventStatusValue;
  String? createdDate;
  bool? isDeleted;
  int? recorderContactPersonAccountId;
  ViewModuleTaskFiles? viewModuleTaskFiles;
  int? commentCount;
  int? documentFileCount;
  int? imageFileCount;
  int? videoFileCount;
  String? extended;
  int? id;
  String? name;
  int? contactId;

  ModuleTasks(
      {this.tableId,
      this.primaryId,
      this.workStepId,
      this.description,
      this.personIds,
      this.contactIds,
      this.workStepName,
      this.deadlineStartDate,
      this.deadlineEndDate,
      this.startDate,
      this.endDate,
      this.realStartDate,
      this.realEndDate,
      this.taskProgress,
      this.orderNo,
      this.auditorApprovalEventStatus,
      this.contactApprovalEventStatus,
      this.ritmaDriveFolderId,
      this.auditorPersonIds,
      this.auditorContactIds,
      this.isAuditorApprovalRequired,
      this.isRelatedContactApprovalRequired,
      this.isRequiredFile,
      this.isRequiredImage,
      this.isRequiredVideo,
      this.eventStatusId,
      this.eventStatusName,
      this.eventStatusValue,
      this.createdDate,
      this.isDeleted,
      this.recorderContactPersonAccountId,
      this.viewModuleTaskFiles,
      this.commentCount,
      this.documentFileCount,
      this.imageFileCount,
      this.videoFileCount,
      this.extended,
      this.id,
      this.name,
      this.contactId});

  ModuleTasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tableId = json['tableId'];
    primaryId = json['primaryId'];
    workStepId = json['workStepId'];
    description = json['description'];
    personIds = json['personIds'] != null
        ? List<Person>.from(
            jsonDecode(json['personIds']).map(
              (model) => model != null ? Person.fromJson(model) : Person(),
            ),
          ).toList()
        : null;
    contactIds = json['contactIds'] != null
        ? List<Person>.from(
            jsonDecode(json['contactIds']).map(
              (model) => model != null ? Person.fromJson(model) : Person(),
            ),
          ).toList()
        : null;
    workStepName = json['workStepName'];
    deadlineStartDate = json['deadlineStartDate'];
    deadlineEndDate = json['deadlineEndDate'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    realStartDate = json['realStartDate'];
    realEndDate = json['realEndDate'];
    taskProgress = json['taskProgress'];
    orderNo = json['orderNo'];
    auditorApprovalEventStatus =
        json['auditorApprovalEventStatus'] != null ? EventStatusValue.fromJson(jsonDecode(json['auditorApprovalEventStatus'])) : null;
    contactApprovalEventStatus =
        json['contactApprovalEventStatus'] != null ? EventStatusValue.fromJson(jsonDecode(json['contactApprovalEventStatus'])) : null;
    ritmaDriveFolderId = json['ritmaDriveFolderId'];
    auditorPersonIds = json['auditorPersonIds'] != null
        ? List<Person>.from(
            jsonDecode(json['auditorPersonIds']).map(
              (model) => Person.fromJson(model),
            ),
          ).toList()
        : null;
    auditorContactIds = json['auditorContactIds'] != null
        ? List<Person>.from(
            jsonDecode(json['auditorContactIds']).map(
              (model) => Person.fromJson(model),
            ),
          ).toList()
        : null;
    isAuditorApprovalRequired = json['isAuditorApprovalRequired'];
    isRelatedContactApprovalRequired = json['isRelatedContactApprovalRequired'];
    isRequiredFile = json['isRequiredFile'];
    isRequiredImage = json['isRequiredImage'];
    isRequiredVideo = json['isRequiredVideo'];
    eventStatusId = json['eventStatusId'];
    eventStatusName = json['eventStatusName'];
    eventStatusValue = json['eventStatusValue'] != null ? EventStatusValue.fromJson(jsonDecode(json['eventStatusValue'])) : null;
    createdDate = json['createdDate'];
    isDeleted = json['isDeleted'];
    recorderContactPersonAccountId = json['recorderContactPersonAccountId'];
    viewModuleTaskFiles = json['viewModuleTaskFiles'] != null ? ViewModuleTaskFiles.fromJson(json['viewModuleTaskFiles']) : null;
    commentCount = json['commentCount'];
    documentFileCount = json['documentFileCount'];
    imageFileCount = json['imageFileCount'];
    videoFileCount = json['videoFileCount'];
    extended = json['extended'];

    name = json['name'];
    contactId = json['contactId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    data['tableId'] = tableId;
    data['primaryId'] = primaryId;
    data['workStepId'] = workStepId;
    data['description'] = description;
    data['personIds'] = personIds;
    data['contactIds'] = contactIds;
    data['workStepName'] = workStepName;
    data['deadlineStartDate'] = deadlineStartDate;
    data['deadlineEndDate'] = deadlineEndDate;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['realStartDate'] = realStartDate;
    data['realEndDate'] = realEndDate;
    data['taskProgress'] = taskProgress;
    data['orderNo'] = orderNo;
    data['auditorApprovalEventStatus'] = auditorApprovalEventStatus;
    data['contactApprovalEventStatus'] = contactApprovalEventStatus;
    data['ritmaDriveFolderId'] = ritmaDriveFolderId;
    data['auditorPersonIds'] = auditorPersonIds;
    data['auditorContactIds'] = auditorContactIds;
    data['isAuditorApprovalRequired'] = isAuditorApprovalRequired;
    data['isRelatedContactApprovalRequired'] = isRelatedContactApprovalRequired;
    data['isRequiredFile'] = isRequiredFile;
    data['isRequiredImage'] = isRequiredImage;
    data['isRequiredVideo'] = isRequiredVideo;
    data['eventStatusId'] = eventStatusId;
    data['eventStatusName'] = eventStatusName;
    if (eventStatusValue != null) {
      data['eventStatusValue'] = eventStatusValue!.toJson();
    }
    data['createdDate'] = createdDate;
    data['isDeleted'] = isDeleted;
    data['recorderContactPersonAccountId'] = recorderContactPersonAccountId;
    if (viewModuleTaskFiles != null) {
      data['viewModuleTaskFiles'] = viewModuleTaskFiles!.toJson();
    }
    data['commentCount'] = commentCount;
    data['documentFileCount'] = documentFileCount;
    data['imageFileCount'] = imageFileCount;
    data['videoFileCount'] = videoFileCount;
    data['extended'] = extended;
    data['id'] = id;
    data['name'] = name;
    data['contactId'] = contactId;
    return data;
  }
}

class EventStatusValue {
  int? orderNo;
  String? colorCode;
  bool? isSms;
  bool? isLogging;
  bool? isEmail;
  bool? isActive;
  bool? isExpired;
  bool? isDefault;
  bool? isStop;
  bool? isWaitingApproval;
  String? personelIds;
  String? departmentIds;
  int? id;
  String? name;
  String? value;
  String? description;
  String? descriptionEn;
  String? parent;

  EventStatusValue(
      {this.orderNo,
      this.colorCode,
      this.isSms,
      this.isLogging,
      this.isEmail,
      this.isActive,
      this.isExpired,
      this.personelIds,
      this.departmentIds,
      this.isWaitingApproval,
      this.id,
      this.name,
      this.value,
      this.description,
      this.descriptionEn,
      this.isDefault,
      this.isStop,
      this.parent});

  EventStatusValue.fromJson(Map<String, dynamic> json) {
    orderNo = json['OrderNo'];
    colorCode = json['ColorCode'];
    isSms = json['IsSms'];
    isLogging = json['IsLogging'];
    isEmail = json['IsEmail'];
    isActive = json['IsActive'];
    isExpired = json['IsExpired'];
    isDefault = json['IsDefault'];
    isStop = json['IsStop'];
    isWaitingApproval = json['IsWaitingApproval'];
    personelIds = json['PersonelIds'];
    departmentIds = json['DepartmentIds'];
    id = json['Id'];
    name = json['Name'];
    value = json['Value'];
    description = json['Description'];
    descriptionEn = json['DescriptionEn'];
    parent = json['Parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['OrderNo'] = orderNo;
    data['ColorCode'] = colorCode;
    data['IsSms'] = isSms;
    data['IsLogging'] = isLogging;
    data['IsEmail'] = isEmail;
    data['IsActive'] = isActive;
    data['IsDefault'] = isDefault;
    data['IsStop'] = isStop;
    data['IsExpired'] = isExpired;
    data['IsWaitingApproval'] = isWaitingApproval;
    data['DepartmentIds'] = departmentIds;
    data['Id'] = id;
    data['Name'] = name;
    data['Value'] = value;
    data['Description'] = description;
    data['DescriptionEn'] = descriptionEn;
    data['Parent'] = parent;
    return data;
  }
}

class ViewModuleTaskFiles {
  String? id;
  dynamic values;

  ViewModuleTaskFiles({this.id, this.values});

  ViewModuleTaskFiles.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    values = json['$values'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = id;
    data['$values'] = values;
    return data;
  }
}
