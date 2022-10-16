class ContactPersonModel {
  String? email;
  String? title;
  String? gender;
  String? mobilePhone;
  int? contactId;
  int? departmentId;
  int? imageFileDocumentId;
  int? adresId;
  bool? isDeleted;
  int? isOutSource;
  String? imagePath;
  bool? hasPermissionToSecurityTab;
  Extended? extended;
  int? id;
  String? name;
  int? recorderContactPersonAccountId;

  ContactPersonModel(
      {this.email,
      this.title,
      this.gender,
      this.mobilePhone,
      this.contactId,
      this.departmentId,
      this.imageFileDocumentId,
      this.adresId,
      this.isDeleted,
      this.isOutSource,
      this.imagePath,
      this.hasPermissionToSecurityTab,
      this.extended,
      this.id,
      this.name,
      this.recorderContactPersonAccountId});

  ContactPersonModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    title = json['title'];
    gender = json['gender'];
    mobilePhone = json['mobilePhone'];
    contactId = json['contactId'];
    departmentId = json['departmentId'];
    imageFileDocumentId = json['imageFileDocumentId'];
    adresId = json['adresId'];
    isDeleted = json['isDeleted'];
    isOutSource = json['isOutSource'];
    imagePath = json['imagePath'];
    hasPermissionToSecurityTab = json['hasPermissionToSecurityTab'];
    extended = json['extended'] != null ? Extended.fromJson(json['extended']) : null;
    id = json['id'];
    name = json['name'];
    recorderContactPersonAccountId = json['recorderContactPersonAccountId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['title'] = title;
    data['gender'] = gender;
    data['mobilePhone'] = mobilePhone;
    data['contactId'] = contactId;
    data['departmentId'] = departmentId;
    data['imageFileDocumentId'] = imageFileDocumentId;
    data['adresId'] = adresId;
    data['isDeleted'] = isDeleted;
    data['isOutSource'] = isOutSource;
    data['imagePath'] = imagePath;
    data['hasPermissionToSecurityTab'] = hasPermissionToSecurityTab;
    if (extended != null) {
      data['extended'] = extended!.toJson();
    }
    data['id'] = id;
    data['name'] = name;
    data['recorderContactPersonAccountId'] = recorderContactPersonAccountId;
    return data;
  }
}

class Extended {
  int? departmentId;
  String? tckn;
  int? militaryService;
  String? militaryServiceExemption;
  int? maritalStatus;
  int? spouseJobStatus;
  String? spouseName;
  String? childrenCount;
  String? fixedPhone;
  String? linkedin;
  String? facebook;
  String? instagram;
  int? isDiseased;
  String? diseaseDescription;
  int? hasHealthReport;
  int? hasContagiousDisease;
  int? disabilityStatus;
  int? disabilityPercent;
  String? disabilityDescription;
  int? id;
  String? name;
  String? value;
  String? description;
  String? descriptionEn;
  String? parent;

  Extended(
      {this.departmentId,
      this.tckn,
      this.militaryService,
      this.militaryServiceExemption,
      this.maritalStatus,
      this.spouseJobStatus,
      this.spouseName,
      this.childrenCount,
      this.fixedPhone,
      this.linkedin,
      this.facebook,
      this.instagram,
      this.isDiseased,
      this.diseaseDescription,
      this.hasHealthReport,
      this.hasContagiousDisease,
      this.disabilityStatus,
      this.disabilityPercent,
      this.disabilityDescription,
      this.id,
      this.name,
      this.value,
      this.description,
      this.descriptionEn,
      this.parent});

  Extended.fromJson(Map<String, dynamic> json) {
    departmentId = json['departmentId'];
    tckn = json['tckn'];
    militaryService = json['militaryService'];
    militaryServiceExemption = json['militaryServiceExemption'];
    maritalStatus = json['maritalStatus'];
    spouseJobStatus = json['spouseJobStatus'];
    spouseName = json['spouseName'];
    childrenCount = json['childrenCount'];
    fixedPhone = json['fixedPhone'];
    linkedin = json['linkedin'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    isDiseased = json['isDiseased'];
    diseaseDescription = json['diseaseDescription'];
    hasHealthReport = json['hasHealthReport'];
    hasContagiousDisease = json['hasContagiousDisease'];
    disabilityStatus = json['disabilityStatus'];
    disabilityPercent = json['disabilityPercent'];
    disabilityDescription = json['disabilityDescription'];
    id = json['id'];
    name = json['name'];
    value = json['value'];
    description = json['description'];
    descriptionEn = json['descriptionEn'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['departmentId'] = departmentId;
    data['tckn'] = tckn;
    data['militaryService'] = militaryService;
    data['militaryServiceExemption'] = militaryServiceExemption;
    data['maritalStatus'] = maritalStatus;
    data['spouseJobStatus'] = spouseJobStatus;
    data['spouseName'] = spouseName;
    data['childrenCount'] = childrenCount;
    data['fixedPhone'] = fixedPhone;
    data['linkedin'] = linkedin;
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    data['isDiseased'] = isDiseased;
    data['diseaseDescription'] = diseaseDescription;
    data['hasHealthReport'] = hasHealthReport;
    data['hasContagiousDisease'] = hasContagiousDisease;
    data['disabilityStatus'] = disabilityStatus;
    data['disabilityPercent'] = disabilityPercent;
    data['disabilityDescription'] = disabilityDescription;
    data['id'] = id;
    data['name'] = name;
    data['value'] = value;
    data['description'] = description;
    data['descriptionEn'] = descriptionEn;
    data['parent'] = parent;
    return data;
  }
}
