import 'dart:convert';

class Person {
  int? accountId;
  int? contactId;
  String? gender;
  String? mobilePhone;
  String? email;
  String? title;
  int? imageFileDocumentId;
  String? imagePath;
  dynamic value;
  int? departmentId;
  int? adresId;
  String? lastLoginDateTime;
  bool? isDeleted;
  int? isOutSource;
  String? color;
  bool? hasPermissionToSecurityTab;
  String? shortName;
  String? extended;
  int? id;
  String? name;
  int? recorderContactPersonAccountId;
  int? affectedRowsCount;
  bool? isProcessedOnDB;
  String? operationDescription;

  Person(
      {this.accountId,
      this.contactId,
      this.gender,
      this.mobilePhone,
      this.email,
      this.title,
      this.imageFileDocumentId,
      this.imagePath,
      this.departmentId,
      this.adresId,
      this.lastLoginDateTime,
      this.isDeleted,
      this.isOutSource,
      this.color,
      this.hasPermissionToSecurityTab,
      this.shortName,
      this.extended,
      this.id,
      this.name,
      this.recorderContactPersonAccountId,
      this.affectedRowsCount,
      this.isProcessedOnDB,
      this.operationDescription});

  Person.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    contactId = json['ContactId'];
    gender = json['Gender'];
    mobilePhone = json['MobilePhone'];
    email = json['Email'];
    title = json['Title'];
    imageFileDocumentId = json['ImageFileDocumentId'];
    imagePath = json['ImagePath'];

    departmentId = json['DepartmentId'];
    adresId = json['AdresId'];
    lastLoginDateTime = json['LastLoginDateTime'];
    isDeleted = json['IsDeleted'];
    isOutSource = json['IsOutSource'];
    color = json['Color'];
    hasPermissionToSecurityTab = json['HasPermissionToSecurityTab'];
    shortName = json['ShortName'];
    extended = json['Extended'];
    id = json['Id'];
    name = json['Name'];
    recorderContactPersonAccountId = json['RecorderContactPersonAccountId'];
    affectedRowsCount = json['AffectedRowsCount'];
    isProcessedOnDB = json['IsProcessedOnDB'];
    operationDescription = json['OperationDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AccountId'] = accountId;
    data['ContactId'] = contactId;
    data['Gender'] = gender;
    data['MobilePhone'] = mobilePhone;
    data['Email'] = email;
    data['Title'] = title;
    data['ImageFileDocumentId'] = imageFileDocumentId;
    data['ImagePath'] = imagePath;

    data['DepartmentId'] = departmentId;
    data['AdresId'] = adresId;
    data['LastLoginDateTime'] = lastLoginDateTime;
    data['IsDeleted'] = isDeleted;
    data['IsOutSource'] = isOutSource;
    data['Color'] = color;
    data['HasPermissionToSecurityTab'] = hasPermissionToSecurityTab;
    data['ShortName'] = shortName;
    data['Extended'] = extended;
    data['Id'] = id;
    data['Name'] = name;
    data['RecorderContactPersonAccountId'] = recorderContactPersonAccountId;
    data['AffectedRowsCount'] = affectedRowsCount;
    data['IsProcessedOnDB'] = isProcessedOnDB;
    data['OperationDescription'] = operationDescription;
    return data;
  }
}
