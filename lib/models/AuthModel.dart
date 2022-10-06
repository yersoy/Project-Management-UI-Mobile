class AuthModel {
  int? id;
  Data? data;
  int? status;
  String? message;
  bool? success;
  bool? failure;
  int? validationEnum;
  String? paginationInfo;

  AuthModel({this.id, this.data, this.status, this.message, this.success, this.failure, this.validationEnum, this.paginationInfo});

  AuthModel.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
    success = json['success'];
    failure = json['failure'];
    validationEnum = json['validationEnum'];
    paginationInfo = json['paginationInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    data['success'] = success;
    data['failure'] = failure;
    data['validationEnum'] = validationEnum;
    data['paginationInfo'] = paginationInfo;
    return data;
  }
}

class Data {
  int? id;
  String? $id;
  String? name;
  String? contactName;
  int? contactId;
  int? subscriberId;
  String? title;
  int? roleId;
  int? isAdmin;
  String? email;
  String? username;
  String? nameSurname;
  String? image;
  String? mobilePhone1;
  String? mobilePhone2;
  int? isLoginable;
  String? token;
  UserAuths? userAuths;

  Data(
      {this.id,
      this.$id,
      this.name,
      this.contactName,
      this.contactId,
      this.subscriberId,
      this.title,
      this.roleId,
      this.isAdmin,
      this.email,
      this.username,
      this.nameSurname,
      this.image,
      this.mobilePhone1,
      this.mobilePhone2,
      this.isLoginable,
      this.token,
      this.userAuths});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    id = json['id'];
    name = json['name'];
    contactName = json['contactName'];
    contactId = json['contactId'];
    subscriberId = json['subscriberId'];
    title = json['title'];
    roleId = json['roleId'];
    isAdmin = json['isAdmin'];
    email = json['email'];
    username = json['username'];
    nameSurname = json['nameSurname'];
    image = json['image'];
    mobilePhone1 = json['mobilePhone1'];
    mobilePhone2 = json['mobilePhone2'];
    isLoginable = json['isLoginable'];
    token = json['token'];
    userAuths = json['userAuths'] != null ? UserAuths.fromJson(json['userAuths']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    data['id'] = id;
    data['name'] = name;
    data['contactName'] = contactName;
    data['contactId'] = contactId;
    data['subscriberId'] = subscriberId;
    data['title'] = title;
    data['roleId'] = roleId;
    data['isAdmin'] = isAdmin;
    data['email'] = email;
    data['username'] = username;
    data['nameSurname'] = nameSurname;
    data['image'] = image;
    data['mobilePhone1'] = mobilePhone1;
    data['mobilePhone2'] = mobilePhone2;
    data['isLoginable'] = isLoginable;
    data['token'] = token;
    if (userAuths != null) {
      data['userAuths'] = userAuths!.toJson();
    }
    return data;
  }
}

class UserAuths {
  int? id;
  Modules? modules;
  Modules? authorizeList;

  UserAuths({this.id, this.modules, this.authorizeList});

  UserAuths.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    modules = json['modules'] != null ? Modules.fromJson(json['modules']) : null;
    authorizeList = json['authorizeList'] != null ? Modules.fromJson(json['authorizeList']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    if (modules != null) {
      data['modules'] = modules!.toJson();
    }
    if (authorizeList != null) {
      data['authorizeList'] = authorizeList!.toJson();
    }
    return data;
  }
}

class Modules {
  int? id;
  List<dynamic>? values;

  Modules({this.id, this.values});

  Modules.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    if (json['$values'] != null) {
      values = <dynamic>[];
      json['$values'].forEach((v) {
        values!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    if (values != null) {
      data['$values'] = values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Extended {
  int? id;
  Create? create;
  Update? update;
  List? list;
  Delete? delete;
  SpecialAuthorizations? specialAuthorizations;
  String? $id;
  Null? name;
  Null? value;
  Null? description;
  Null? descriptionEn;
  Null? parent;

  Extended(
      {this.$id,
      this.create,
      this.update,
      this.list,
      this.delete,
      this.specialAuthorizations,
      this.id,
      this.name,
      this.value,
      this.description,
      this.descriptionEn,
      this.parent});

  Extended.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    create = json['create'] != null ? Create.fromJson(json['create']) : null;
    update = json['update'] != null ? Update.fromJson(json['update']) : null;
    if (json['list'] != null) {
      list = <dynamic>[];
      json['list'].forEach((v) {
        list!.add(v);
      });
    }
    delete = json['delete'] != null ? Delete.fromJson(json['delete']) : null;
    specialAuthorizations = json['specialAuthorizations'] != null ? SpecialAuthorizations.fromJson(json['specialAuthorizations']) : null;
    id = json['id'];
    name = json['name'];
    value = json['value'];
    description = json['description'];
    descriptionEn = json['descriptionEn'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    if (create != null) {
      data['create'] = create!.toJson();
    }
    if (update != null) {
      data['update'] = update!.toJson();
    }
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    if (delete != null) {
      data['delete'] = delete!.toJson();
    }
    if (specialAuthorizations != null) {
      data['specialAuthorizations'] = specialAuthorizations!.toJson();
    }
    data['id'] = id;
    data['name'] = name;
    data['value'] = value;
    data['description'] = description;
    data['descriptionEn'] = descriptionEn;
    data['parent'] = parent;
    return data;
  }
}

class Create {
  int? id;
  bool? create;
  bool? otherCreate;
  bool? blockCreate;
  Null? personalIds;
  Null? departmanIds;
  Null? contactIds;

  Create({this.id, this.create, this.otherCreate, this.blockCreate, this.personalIds, this.departmanIds, this.contactIds});

  Create.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    create = json['create'];
    otherCreate = json['otherCreate'];
    blockCreate = json['blockCreate'];
    personalIds = json['personal_Ids'];
    departmanIds = json['departman_Ids'];
    contactIds = json['contact_Ids'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    data['create'] = create;
    data['otherCreate'] = otherCreate;
    data['blockCreate'] = blockCreate;
    data['personal_Ids'] = personalIds;
    data['departman_Ids'] = departmanIds;
    data['contact_Ids'] = contactIds;
    return data;
  }
}

class Update {
  int? id;
  bool? update;
  bool? otherUpdate;
  bool? blockUpdate;
  Null? personalIds;
  Null? departmanIds;
  Null? contactIds;

  Update({this.id, this.update, this.otherUpdate, this.blockUpdate, this.personalIds, this.departmanIds, this.contactIds});

  Update.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    update = json['update'];
    otherUpdate = json['otherUpdate'];
    blockUpdate = json['blockUpdate'];
    personalIds = json['personal_Ids'];
    departmanIds = json['departman_Ids'];
    contactIds = json['contact_Ids'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    data['update'] = update;
    data['otherUpdate'] = otherUpdate;
    data['blockUpdate'] = blockUpdate;
    data['personal_Ids'] = personalIds;
    data['departman_Ids'] = departmanIds;
    data['contact_Ids'] = contactIds;
    return data;
  }
}

class Delete {
  int? id;
  bool? delete;
  bool? otherDelete;
  bool? blockDelete;
  Null? personalIds;
  Null? departmanIds;
  Null? contactIds;

  Delete({this.id, this.delete, this.otherDelete, this.blockDelete, this.personalIds, this.departmanIds, this.contactIds});

  Delete.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    delete = json['delete'];
    otherDelete = json['otherDelete'];
    blockDelete = json['blockDelete'];
    personalIds = json['personal_Ids'];
    departmanIds = json['departman_Ids'];
    contactIds = json['contact_Ids'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    data['delete'] = delete;
    data['otherDelete'] = otherDelete;
    data['blockDelete'] = blockDelete;
    data['personal_Ids'] = personalIds;
    data['departman_Ids'] = departmanIds;
    data['contact_Ids'] = contactIds;
    return data;
  }
}

class SpecialAuthorizations {
  int? id;
  bool? changeContact;
  bool? approveOrRejectServiceProduct;
  bool? serviceChangeWorkOrder;
  bool? offerLockOrUnlock;

  SpecialAuthorizations({this.id, this.changeContact, this.approveOrRejectServiceProduct, this.serviceChangeWorkOrder, this.offerLockOrUnlock});

  SpecialAuthorizations.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    changeContact = json['changeContact'];
    approveOrRejectServiceProduct = json['approveOrRejectServiceProduct'];
    serviceChangeWorkOrder = json['serviceChangeWorkOrder'];
    offerLockOrUnlock = json['offerLockOrUnlock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    data['changeContact'] = changeContact;
    data['approveOrRejectServiceProduct'] = approveOrRejectServiceProduct;
    data['serviceChangeWorkOrder'] = serviceChangeWorkOrder;
    data['offerLockOrUnlock'] = offerLockOrUnlock;
    return data;
  }
}
