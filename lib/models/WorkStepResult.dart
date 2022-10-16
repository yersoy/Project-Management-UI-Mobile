class WorkStepResult {
  String? id;
  bool? data;
  int? status;
  String? message;
  bool? success;
  bool? failure;
  int? validationEnum;
  dynamic paginationInfo;

  WorkStepResult({this.id, this.data, this.status, this.message, this.success, this.failure, this.validationEnum, this.paginationInfo});

  WorkStepResult.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    data = json['data'];
    status = json['status'];
    message = json['message'];
    success = json['success'];
    failure = json['failure'];
    validationEnum = json['validationEnum'];
    paginationInfo = json['paginationInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    data['data'] = this.data;
    data['status'] = this.status;
    data['message'] = this.message;
    data['success'] = this.success;
    data['failure'] = this.failure;
    data['validationEnum'] = this.validationEnum;
    data['paginationInfo'] = this.paginationInfo;
    return data;
  }
}
