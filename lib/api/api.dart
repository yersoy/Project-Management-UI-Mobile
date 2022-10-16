// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';

import 'package:cilekhavuz/api/base.dart';
import 'package:cilekhavuz/api/urls.dart';
import 'package:cilekhavuz/models/AuthModel.dart';
import 'package:cilekhavuz/models/ContactPersonModel.dart';
import 'package:cilekhavuz/models/DriveFileAddedResult.dart';
import 'package:cilekhavuz/models/FileResult.dart';
import 'package:cilekhavuz/models/ModuleTasks.dart';
import 'package:cilekhavuz/models/WorkStepResult.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class API {
  static String tenantName = "sisel";
  static String url = "zy.ritmaflex.com";
  static String driveUrl = "195.142.132.122:3003";

  static int taskcount = 0;
  static Future<AuthModel> login(String username, String password) async {
    final response = await http.post(
        Uri.http(
          url,
          URL.loginUrl,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({"userName": username, "value": password}));
    return AuthModel.fromJson(jsonDecode(response.body));
  }

  static Future<List<ContactPersonModel>> getPersonnelByContactId() async {
    var user = await BASE.getUser();
    Dio dio = Dio();
    dio.options.baseUrl = "http://$url";
    dio.options.headers['Content-Type'] = 'application/json; charset=UTF-8';
    dio.options.headers["Authorization"] = user!.data!.token;

    final response = await dio.post(URL.getPersonnelByContactId,
        data: json.encode({
          "Id": user.data!.contactId,
        }));
    var data = response.data["data"]["\$values"];
    taskcount = data.length;
    var result = List<ContactPersonModel>.from(
      data.map(
        (model) => ContactPersonModel.fromJson(model),
      ),
    );
    return result;
  }

  static Future<String> getDriveToken() async {
    final response = await http.get(
      Uri.http(
        driveUrl,
        URL.driveGetToken,
      ),
      headers: <String, String>{
        'Accept': 'text/plain',
      },
    );
    return jsonDecode(response.body)["data"]["accessToken"];
  }

  static Future<bool> uploadDriveFile(ModuleTasks task, FilePickerResult file, context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    var token = await BASE.getDriveToken();
    FormData formData = FormData.fromMap({
      "FolderId": task.ritmaDriveFolderId,
      "ContactId": task.contactId,
      "RecorderContactPersonAccountId": task.recorderContactPersonAccountId,
      "ModuleId": 2898,
      "PrimaryId": task.primaryId,
      "FileKeyType": 1,
      "file": await MultipartFile.fromFile(file.files.first.path!, filename: file.files.first.name),
    });
    Dio dio = Dio();
    dio.options.baseUrl = "http://$driveUrl";
    dio.options.headers['Content-Type'] = 'multipart/form-data';
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["x-api-version"] = "1.0";
    dio.options.headers["Accept"] = 'application/json';

    final response = await dio.post(URL.driveUploadFile, data: formData);
    var data = FileAddedResult.fromJson(response.data);
    var check = await API.addTaskFileToModuleTasks(data, task);
    if (check) {
      Navigator.pop(context);
      return true;
    }
    return false;
  }

  static Future<bool> uploadDriveFileImage(ModuleTasks task, XFile file, context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    var token = await BASE.getDriveToken();
    FormData formData = FormData.fromMap({
      "FolderId": task.ritmaDriveFolderId,
      "ContactId": task.contactId,
      "RecorderContactPersonAccountId": task.recorderContactPersonAccountId,
      "ModuleId": 2898,
      "PrimaryId": task.primaryId,
      "FileKeyType": 1,
      "file": await MultipartFile.fromFile(file.path, filename: file.name),
    });
    Dio dio = Dio();
    dio.options.baseUrl = "http://$driveUrl";
    dio.options.headers['Content-Type'] = 'multipart/form-data';
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["x-api-version"] = "1.0";
    dio.options.headers["Accept"] = 'application/json';

    final response = await dio.post(URL.driveUploadFile, data: formData);
    var data = FileAddedResult.fromJson(response.data);
    var check = await API.addTaskFileToModuleTasks(data, task);
    if (check) {
      Navigator.pop(context);
      return true;
    }
    return false;
  }

  static Future<bool> deleteDriveFile(String id) async {
    var token = await BASE.getDriveToken();
    final response = await http.delete(
        Uri.http(
          driveUrl,
          URL.driveDeleteFile,
        ),
        headers: <String, String>{
          'Content-Type': 'text/json',
          'Accept': 'text/json',
          'Authorization': "Bearer $token",
          'x-api-version': '1.0',
        },
        body: json.encode(id));
    return jsonDecode(response.body)["succeeded"];
  }

  static Future<String> getDriveNewFolder(ModuleTasks task) async {
    var token = await BASE.getDriveToken();
    final response = await http.post(
        Uri.http(
          driveUrl,
          URL.driveCreateFolder,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': "*",
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'X-Foo',
          'Access-Control-Max-Age': '3600',
          'Accept': 'text/plain',
          'x-api-version': '1.0',
          'Authorization': "Bearer $token",
        },
        body: json.encode({
          "folderName": task.name,
          "contactId": task.contactId,
          "recorderContactPersonAccountId": task.recorderContactPersonAccountId,
          "moduleId": 2898,
          "primaryId": task.primaryId
        }));
    return jsonDecode(response.body)["data"];
  }

  static Future<FileResult> getDriveFilebyId(String id, int primaryId) async {
    var token = await BASE.getDriveToken();
    final response = await http.post(
        Uri.http(
          driveUrl,
          URL.driveGetFile,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': "*",
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'X-Foo',
          'Access-Control-Max-Age': '3600',
          'Accept': 'text/plain',
          'x-api-version': '1.0',
          'Authorization': "Bearer $token",
        },
        body: json.encode({"parentId": id, "moduleId": 2898, "primaryId": primaryId}));
    return FileResult.fromJson(jsonDecode(response.body));
  }

  static Future<List<ModuleTasks>> workSteps() async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepsUrl,
        ),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': user!.data!.token!},
        body: json.encode({
          "Entity": {
            "tableId": 2898,
          },
          "userId": user.data!.id!
        }));
    var data = json.decode(const Utf8Decoder().convert(response.bodyBytes))["data"]["\$values"];
    taskcount = data.length;
    return List<ModuleTasks>.from(
      data.map(
        (model) => ModuleTasks.fromJson(model),
      ),
    );
  }

  static Future<ModuleTasks> workStep(int id) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepGet,
        ),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': user!.data!.token!},
        body: json.encode({
          "Entity": {
            "tableId": 2898,
          },
          "userId": user.data!.id!,
          "Id": id
        }));
    var data = json.decode(const Utf8Decoder().convert(response.bodyBytes))["data"];
    taskcount = data.length;
    return ModuleTasks.fromJson(data);
  }

  static Future<WorkStepResult> workStepEdit(ModuleTasks task) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepEdit,
        ),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': user!.data!.token!},
        body: json.encode({
          "Entity": {"TaskProgress": task.taskProgress, "Description": task.description, "RitmaDriveFolderId": task.ritmaDriveFolderId},
          "Id": task.id,
          "userId": user.data!.id!
        }));
    var data = json.decode(const Utf8Decoder().convert(response.bodyBytes));
    return WorkStepResult.fromJson(data);
  }

  static Future<WorkStepResult> workStepStart(ModuleTasks task) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepStartTask,
        ),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': user!.data!.token!},
        body: json.encode({"Id": task.id}));
    var data = json.decode(const Utf8Decoder().convert(response.bodyBytes));
    return WorkStepResult.fromJson(data);
  }

  static Future<WorkStepResult> workStepStop(ModuleTasks task) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepStopTask,
        ),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': user!.data!.token!},
        body: json.encode({
          "Id": task.id,
          "OwnerId": task.contactId,
          "userId": user.data!.id!,
          "Entity": {"StartDate": task.startDate},
          "Extend": {"Description": task.description}
        }));
    var data = json.decode(const Utf8Decoder().convert(response.bodyBytes));
    return WorkStepResult.fromJson(data);
  }

  static Future<WorkStepResult> workStepRedirect(ModuleTasks task, String personIds) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepRedirectTaskPersonels,
        ),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': user!.data!.token!},
        body: json.encode({
          "Id": task.id,
          "Entity": {"PersonIds": personIds}
        }));
    var data = json.decode(const Utf8Decoder().convert(response.bodyBytes));
    return WorkStepResult.fromJson(data);
  }

  static Future<WorkStepResult> workStepComplete(ModuleTasks task) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepCompleteTask,
        ),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': user!.data!.token!},
        body: json.encode({
          "Id": task.id,
        }));
    var data = json.decode(const Utf8Decoder().convert(response.bodyBytes));
    return WorkStepResult.fromJson(data);
  }

  static Future<bool> addTaskFileToModuleTasks(FileAddedResult file, ModuleTasks task) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepAddFiletoModules,
        ),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': user!.data!.token!},
        body: json.encode({
          "Entity": {
            "FolderId": task.ritmaDriveFolderId,
            "DriveId": file.data!.id,
            "FileTypeId": file.data!.fileTypeId,
            "Url": file.data!.url,
          },
          "Id": task.primaryId,
          "OwnerId": user.data!.contactId,
          "UserId": user.data!.id,
        }));
    var data = json.decode(response.body);
    return data["data"];
  }

  static Future<WorkStepResult> workStepSubmitForApprove(ModuleTasks task) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepSubmitTaskForApproval,
        ),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': user!.data!.token!},
        body: json.encode({"Id": task.id, "UserId": user.data!.id!}));
    var data = json.decode(const Utf8Decoder().convert(response.bodyBytes));
    return WorkStepResult.fromJson(data);
  }

  static Future<WorkStepResult> workStepApproveTask(ModuleTasks task) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepApproveTask,
        ),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': user!.data!.token!},
        body: json.encode({
          "Id": task.id,
        }));
    var data = json.decode(const Utf8Decoder().convert(response.bodyBytes));
    return WorkStepResult.fromJson(data);
  }

  static Future<WorkStepResult> workStepRejectTask(ModuleTasks task) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepRejectTask,
        ),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': user!.data!.token!},
        body: json.encode({
          "Id": task.id,
          "userId": user.data!.id!,
          "Extend": {"Description": task.description}
        }));
    var data = json.decode(const Utf8Decoder().convert(response.bodyBytes));
    return WorkStepResult.fromJson(data);
  }
}
