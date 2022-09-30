class ModuleTasks {
  int? tableId;
  int? primaryId;
  int? workStepId;
  String? description;
  String? personIds;
  String? contactIds;
  String? workStepName;
  String? deadlineStartDate;
  String? deadlineEndDate;
  String? startDate;
  String? endDate;
  String? realStartDate;
  String? realEndDate;
  int? taskProgress;
  int? orderNo;
  String? auditorApprovalEventStatus;
  String? contactApprovalEventStatus;
  String? ritmaDriveFolderId;
  String? auditorPersonIds;
  String? auditorContactIds;
  bool? isAuditorApprovalRequired;
  bool? isRelatedContactApprovalRequired;
  bool? isRequiredFile;
  bool? isRequiredImage;
  bool? isRequiredVideo;
  int? eventStatusId;
  String? eventStatusName;
  String? eventStatusValue;
  String? createdDate;
  bool? isDeleted;
  int? recorderContactPersonAccountId;
  dynamic viewModuleTaskFiles;
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
    id = json['$id'];
    tableId = json['tableId'];
    primaryId = json['primaryId'];
    workStepId = json['workStepId'];
    description = json['description'];
    personIds = json['personIds'];
    contactIds = json['contactIds'];
    workStepName = json['workStepName'];
    deadlineStartDate = json['deadlineStartDate'];
    deadlineEndDate = json['deadlineEndDate'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    realStartDate = json['realStartDate'];
    realEndDate = json['realEndDate'];
    taskProgress = json['taskProgress'];
    orderNo = json['orderNo'];
    auditorApprovalEventStatus = json['auditorApprovalEventStatus'];
    contactApprovalEventStatus = json['contactApprovalEventStatus'];
    ritmaDriveFolderId = json['ritmaDriveFolderId'];
    auditorPersonIds = json['auditorPersonIds'];
    auditorContactIds = json['auditorContactIds'];
    isAuditorApprovalRequired = json['isAuditorApprovalRequired'];
    isRelatedContactApprovalRequired = json['isRelatedContactApprovalRequired'];
    isRequiredFile = json['isRequiredFile'];
    isRequiredImage = json['isRequiredImage'];
    isRequiredVideo = json['isRequiredVideo'];
    eventStatusId = json['eventStatusId'];
    eventStatusName = json['eventStatusName'];
    eventStatusValue = json['eventStatusValue'];
    createdDate = json['createdDate'];
    isDeleted = json['isDeleted'];
    recorderContactPersonAccountId = json['recorderContactPersonAccountId'];
    viewModuleTaskFiles = json['viewModuleTaskFiles'];
    commentCount = json['commentCount'];
    documentFileCount = json['documentFileCount'];
    imageFileCount = json['imageFileCount'];
    videoFileCount = json['videoFileCount'];
    extended = json['extended'];
    id = json['id'];
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
    data['isRelatedContactApprovalRequired'] =
        isRelatedContactApprovalRequired;
    data['isRequiredFile'] = isRequiredFile;
    data['isRequiredImage'] = isRequiredImage;
    data['isRequiredVideo'] = isRequiredVideo;
    data['eventStatusId'] = eventStatusId;
    data['eventStatusName'] = eventStatusName;
    data['eventStatusValue'] = eventStatusValue;
    data['createdDate'] = createdDate;
    data['isDeleted'] = isDeleted;
    data['recorderContactPersonAccountId'] =
        recorderContactPersonAccountId;
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
