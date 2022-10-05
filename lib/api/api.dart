// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';

import 'package:cilekhavuz/api/base.dart';
import 'package:cilekhavuz/api/urls.dart';
import 'package:cilekhavuz/models/AuthModel.dart';
import 'package:cilekhavuz/models/ModuleTasks.dart';
import 'package:http/http.dart' as http;

class API {
  static String tenantName = "sisel";
  static String url = "192.168.1.3:45455";
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

  static Future<List<ModuleTasks>> workSteps() async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepsUrl,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': user!.data!.token!
        },
        body: json.encode({
          "Entity": {
            "tableId": 2898,
          },
          "userId": user.data!.id!
        }));
    var data =
        json.decode(const Utf8Decoder().convert(response.bodyBytes))["data"]
            ["\$values"];
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
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': user!.data!.token!
        },
        body: json.encode({
          "Entity": {
            "tableId": 2898,
          },
          "userId": user.data!.id!,
          "Id": id
        }));
    var data =
        json.decode(const Utf8Decoder().convert(response.bodyBytes))["data"];
    taskcount = data.length;
    return ModuleTasks.fromJson(data);
  }

  static Future<bool> workStepEdit(ModuleTasks task) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepEdit,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': user!.data!.token!
        },
        body: json.encode({
          "Entity": {
            "TaskProgress": task.taskProgress,
            "Description": task.description
          },
          "Id": task.id,
          "userId": user.data!.id!
        }));
    var data =
        json.decode(const Utf8Decoder().convert(response.bodyBytes))["data"];
    return data;
  }

  static Future<bool> workStepStart(ModuleTasks task) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepStartTask,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': user!.data!.token!
        },
        body: json.encode({"Id": task.id}));
    var data =
        json.decode(const Utf8Decoder().convert(response.bodyBytes))["data"];
    return data;
  }

  static Future<bool> workStepComplete(ModuleTasks task) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepCompleteTask,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': user!.data!.token!
        },
        body: json.encode({
          "Id": task.id,
        }));
    var data =
        json.decode(const Utf8Decoder().convert(response.bodyBytes))["data"];
    return data;
  }

  static Future<bool> workStepSubmitForApprove(ModuleTasks task) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepSubmitTaskForApproval,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': user!.data!.token!
        },
        body: json.encode({"Id": task.id, "UserId": user.data!.id!}));
    var data =
        json.decode(const Utf8Decoder().convert(response.bodyBytes))["data"];
    return data;
  }

  static Future<bool> workStepApproveTask(ModuleTasks task) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepApproveTask,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': user!.data!.token!
        },
        body: json.encode({
          "Id": task.id,
        }));
    var data =
        json.decode(const Utf8Decoder().convert(response.bodyBytes))["data"];
    return data;
  }

  static Future<bool> workStepRejectTask(ModuleTasks task) async {
    var user = await BASE.getUser();
    final response = await http.post(
        Uri.http(
          url,
          URL.workstepRejectTask,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': user!.data!.token!
        },
        body: json.encode({"Id": task.id, "userId": user.data!.id!,"Extend":{"Description":task.description}}));
    var data =
        json.decode(const Utf8Decoder().convert(response.bodyBytes))["data"];
    return data;
  }
}
