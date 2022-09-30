class AuthModel {
  int? id;
  Data? data;
  int? status;
  String? message;
  bool? success;
  bool? failure;
  int? validationEnum;
  Null? paginationInfo;

  AuthModel({this.id, this.data, this.status, this.message, this.success, this.failure, this.validationEnum, this.paginationInfo});

  AuthModel.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    data['success'] = this.success;
    data['failure'] = this.failure;
    data['validationEnum'] = this.validationEnum;
    data['paginationInfo'] = this.paginationInfo;
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
    userAuths = json['userAuths'] != null ? new UserAuths.fromJson(json['userAuths']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    data['id'] = this.id;
    data['name'] = this.name;
    data['contactName'] = this.contactName;
    data['contactId'] = this.contactId;
    data['subscriberId'] = this.subscriberId;
    data['title'] = this.title;
    data['roleId'] = this.roleId;
    data['isAdmin'] = this.isAdmin;
    data['email'] = this.email;
    data['username'] = this.username;
    data['nameSurname'] = this.nameSurname;
    data['image'] = this.image;
    data['mobilePhone1'] = this.mobilePhone1;
    data['mobilePhone2'] = this.mobilePhone2;
    data['isLoginable'] = this.isLoginable;
    data['token'] = this.token;
    if (this.userAuths != null) {
      data['userAuths'] = this.userAuths!.toJson();
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
    modules = json['modules'] != null ? new Modules.fromJson(json['modules']) : null;
    authorizeList = json['authorizeList'] != null ? new Modules.fromJson(json['authorizeList']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    if (this.modules != null) {
      data['modules'] = this.modules!.toJson();
    }
    if (this.authorizeList != null) {
      data['authorizeList'] = this.authorizeList!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    if (this.values != null) {
      data['$values'] = this.values!.map((v) => v.toJson()).toList();
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
    create = json['create'] != null ? new Create.fromJson(json['create']) : null;
    update = json['update'] != null ? new Update.fromJson(json['update']) : null;
    if (json['list'] != null) {
      list = <dynamic>[];
      json['list'].forEach((v) {
        list!.add(v);
      });
    }
    delete = json['delete'] != null ? new Delete.fromJson(json['delete']) : null;
    specialAuthorizations = json['specialAuthorizations'] != null ? new SpecialAuthorizations.fromJson(json['specialAuthorizations']) : null;
    id = json['id'];
    name = json['name'];
    value = json['value'];
    description = json['description'];
    descriptionEn = json['descriptionEn'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    if (this.create != null) {
      data['create'] = this.create!.toJson();
    }
    if (this.update != null) {
      data['update'] = this.update!.toJson();
    }
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    if (this.delete != null) {
      data['delete'] = this.delete!.toJson();
    }
    if (this.specialAuthorizations != null) {
      data['specialAuthorizations'] = this.specialAuthorizations!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['value'] = this.value;
    data['description'] = this.description;
    data['descriptionEn'] = this.descriptionEn;
    data['parent'] = this.parent;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    data['create'] = this.create;
    data['otherCreate'] = this.otherCreate;
    data['blockCreate'] = this.blockCreate;
    data['personal_Ids'] = this.personalIds;
    data['departman_Ids'] = this.departmanIds;
    data['contact_Ids'] = this.contactIds;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    data['update'] = this.update;
    data['otherUpdate'] = this.otherUpdate;
    data['blockUpdate'] = this.blockUpdate;
    data['personal_Ids'] = this.personalIds;
    data['departman_Ids'] = this.departmanIds;
    data['contact_Ids'] = this.contactIds;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    data['delete'] = this.delete;
    data['otherDelete'] = this.otherDelete;
    data['blockDelete'] = this.blockDelete;
    data['personal_Ids'] = this.personalIds;
    data['departman_Ids'] = this.departmanIds;
    data['contact_Ids'] = this.contactIds;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    data['changeContact'] = this.changeContact;
    data['approveOrRejectServiceProduct'] = this.approveOrRejectServiceProduct;
    data['serviceChangeWorkOrder'] = this.serviceChangeWorkOrder;
    data['offerLockOrUnlock'] = this.offerLockOrUnlock;
    return data;
  }
}
