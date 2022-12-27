class MaterialModel {
  int? moduleTaskId;
  int? moduleRecordId;
  String? moduleRecordNo;
  int? moduleProductId;
  String? productCode;
  String? productName;
  int? totalQuantity;
  int? totalUsedQuantity;
  int? usedQuantity;
  bool? isDeleted;
  String? unit;
  String? name;
  int? remainingQuantity;
  double? usedPercent;
  String? extended;
  int? id;
  int? recorderContactPersonAccountId;
  int? contactId;

  MaterialModel(
      {this.id,
      this.moduleTaskId,
      this.moduleRecordId,
      this.moduleRecordNo,
      this.moduleProductId,
      this.productCode,
      this.productName,
      this.totalQuantity,
      this.totalUsedQuantity,
      this.usedQuantity,
      this.isDeleted,
      this.unit,
      this.name,
      this.remainingQuantity,
      this.usedPercent,
      this.extended,
      this.recorderContactPersonAccountId,
      this.contactId});

  MaterialModel.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    moduleTaskId = json['moduleTaskId'];
    moduleRecordId = json['moduleRecordId'];
    moduleRecordNo = json['moduleRecordNo'];
    moduleProductId = json['moduleProductId'];
    productCode = json['productCode'];
    productName = json['productName'];
    totalQuantity = json['totalQuantity'];
    totalUsedQuantity = json['totalUsedQuantity'];
    usedQuantity = json['usedQuantity'];
    isDeleted = json['isDeleted'];
    unit = json['unit'];
    name = json['name'];
    remainingQuantity = json['remainingQuantity'];
    usedPercent = double.tryParse(json['usedPercent'].toString());
    extended = json['extended'];
    id = json['id'];
    recorderContactPersonAccountId = json['recorderContactPersonAccountId'];
    contactId = json['contactId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    data['moduleTaskId'] = moduleTaskId;
    data['moduleRecordId'] = moduleRecordId;
    data['moduleRecordNo'] = moduleRecordNo;
    data['moduleProductId'] = moduleProductId;
    data['productCode'] = productCode;
    data['productName'] = productName;
    data['totalQuantity'] = totalQuantity;
    data['totalUsedQuantity'] = totalUsedQuantity;
    data['usedQuantity'] = usedQuantity;
    data['isDeleted'] = isDeleted;
    data['unit'] = unit;
    data['name'] = name;
    data['remainingQuantity'] = remainingQuantity;
    data['usedPercent'] = usedPercent;
    data['extended'] = extended;
    data['id'] = id;
    data['recorderContactPersonAccountId'] =
        recorderContactPersonAccountId;
    data['contactId'] = contactId;
    return data;
  }
}
