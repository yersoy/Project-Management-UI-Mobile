class FileResult {
  List<Data>? data;
  bool? succeeded;
  String? errorMessage;

  FileResult({this.data, this.succeeded, this.errorMessage});

  FileResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    succeeded = json['succeeded'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['succeeded'] = this.succeeded;
    data['errorMessage'] = this.errorMessage;
    return data;
  }
}

class Data {
  String? id;
  String? folderId;
  int? fileTypeId;
  bool? isFavorite;
  String? name;
  String? savedName;
  String? path;
  int? fileSizeInBytes;
  String? url;
  String? createdAt;

  Data(
      {this.id,
      this.folderId,
      this.fileTypeId,
      this.isFavorite,
      this.name,
      this.savedName,
      this.path,
      this.fileSizeInBytes,
      this.url,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    folderId = json['folderId'];
    fileTypeId = json['fileTypeId'];
    isFavorite = json['isFavorite'];
    name = json['name'];
    savedName = json['savedName'];
    path = json['path'];
    fileSizeInBytes = json['fileSizeInBytes'];
    url = json['url'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['folderId'] = this.folderId;
    data['fileTypeId'] = this.fileTypeId;
    data['isFavorite'] = this.isFavorite;
    data['name'] = this.name;
    data['savedName'] = this.savedName;
    data['path'] = this.path;
    data['fileSizeInBytes'] = this.fileSizeInBytes;
    data['url'] = this.url;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
