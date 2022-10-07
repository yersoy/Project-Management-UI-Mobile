import 'dart:convert';

import 'package:cilekhavuz/api/api.dart';
import 'package:cilekhavuz/api/base.dart';
import 'package:cilekhavuz/models/AuthModel.dart';
import 'package:cilekhavuz/models/ModuleTasks.dart';
import 'package:cilekhavuz/models/Person.dart';
import 'package:cilekhavuz/models/WorkStepResult.dart';
import 'package:cilekhavuz/models/tasktatus.dart';
import 'package:cilekhavuz/pages/shared/boxtile.dart';
import 'package:cilekhavuz/utils/constants.dart';
import 'package:cilekhavuz/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Task extends StatefulWidget {
  ModuleTasks task;
  final bool isAuthorized;
  Task({Key? key, required this.task, required this.isAuthorized})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  DateTime? startDate;
  DateTime? endDate;
  bool disableui = false;
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  double taskPercent = 0.0;

  TaskStatus? dropdownValue;
  final ImagePicker _picker = ImagePicker();
  List<TaskStatus> taskStatusList = [
    TaskStatus(color: const Color(0xff50cd89), name: "Tamamlandı"),
    TaskStatus(color: const Color(0xff009ef7), name: "Yapım Aşamasında"),
    TaskStatus(color: const Color(0xffe79da4), name: "Süresi Geçmiş"),
    TaskStatus(color: Colors.grey, name: "Henüz Başlanmadı"),
  ];
  List<XFile> images = <XFile>[];
  List<XFile> videos = <XFile>[];
  AuthModel? user;
  List<FilePickerResult> files = <FilePickerResult>[];
  Future<void> _launchUrl(_url) async {
    //You can download a single file
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    await FileDownloader.downloadFile(
        url: _url,
        onDownloadCompleted: (String path) {
          Navigator.pop(context);
          Utils.showDefaultSnackbar(
              context,
              "Başarıyla İndirildi",
              const Icon(
                LineIcons.download,
                color: Colors.green,
              ));
        },
        onDownloadError: (String error) {
          Utils.showDefaultSnackbar(
              context,
              "Dosya İndirilemedi",
              const Icon(
                LineIcons.times,
                color: Colors.red,
              ));
        });
  }

  Future uploadImage(XFile image) async {
    await API.uploadDriveFileImage(widget.task, image, context);
    setState(() {
      images.add(image);
    });
  }

  Future uploadVideo(XFile video) async {
    await API.uploadDriveFileImage(widget.task, video, context);
    setState(() {
      videos.add(video);
    });
  }

  Future uploadFile(FilePickerResult file) async {
    await API.uploadDriveFile(widget.task, file, context);
    setState(() {
      files.add(file);
    });
  }

  Future<bool> deleteFile(String id) async {
    return await API.deleteDriveFile(id).then((value) {
      Utils.showDefaultSnackbar(
          context,
          "Dosya Başarıyla Temizlendi",
          const Icon(
            LineIcons.trash,
            color: Colors.red,
          ));
      return true;
    });
  }

  Future editTask(ModuleTasks task, context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    WorkStepResult data = await API.workStepEdit(task);
    if (data.data!) {
      Navigator.pop(context);
      Utils.showDefaultSnackbar(context, "Görev Başarıyla Güncellendi!",
          const Icon(Icons.check, color: Colors.green));
      return data.data!;
    } else {
         Navigator.pop(context);
      Utils.showDefaultSnackbar(
          context,
          data.message!,
          const Icon(
            Icons.check,
            color: Colors.green,
          ));
    }
  }

  Future startTask(ModuleTasks task, context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    WorkStepResult data = await API.workStepStart(task);
    if (data.data!) {
      Navigator.pop(context);
      Navigator.pop(context);
      Utils.showDefaultSnackbar(context, "Görev Başarıyla Başlatıldı!",
          const Icon(Icons.check, color: Colors.green));
    } else {
      Navigator.pop(context);

      Utils.showDefaultSnackbar(
          context,
          data.message!,
          const Icon(
            Icons.check,
            color: Colors.green,
          ));
    }
  }

  Future completeTask(ModuleTasks task, context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    WorkStepResult data = await API.workStepComplete(task);
    if (data.data!) {
      Navigator.pop(context);
      Navigator.pop(context);
      Utils.showDefaultSnackbar(context, "Görev Başarıyla Tamamlandı!",
          const Icon(Icons.check, color: Colors.green));
    } else {
      Navigator.pop(context);

      Utils.showDefaultSnackbar(
          context,
          data.message!,
          const Icon(
            Icons.check,
            color: Colors.red,
          ));
    }
  }

  Future approveTask(ModuleTasks task, context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    WorkStepResult data = await API.workStepApproveTask(task);
    if (data.data!) {
      Navigator.pop(context);
      Navigator.pop(context);
      Utils.showDefaultSnackbar(context, "Görev Başarıyla Onaylandı!",
          const Icon(Icons.check, color: Colors.green));
    } else {
      Navigator.pop(context);

      Utils.showDefaultSnackbar(
          context,
          data.message!,
          const Icon(
            Icons.check,
            color: Colors.red,
          ));
    }
  }

  Future submitTaskForApproval(ModuleTasks task, context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    await API.workStepEdit(task);
    WorkStepResult data = await API.workStepSubmitForApprove(task);
    if (data.data!) {
      Navigator.pop(context);
      Navigator.pop(context);
      Utils.showDefaultSnackbar(context, "Görev onaya gönderildi!",
          const Icon(Icons.check, color: Colors.green));
    } else {
      Navigator.pop(context);
      Utils.showDefaultSnackbar(
          context,
          data.message!,
          const Icon(
            Icons.check,
            color: Colors.red,
          ));
    }
  }

  Future rejectTask(ModuleTasks task, context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    WorkStepResult data = await API.workStepRejectTask(task);
    if (data.data!) {
      Navigator.pop(context);
      Navigator.pop(context);
      Utils.showDefaultSnackbar(context, "Görev Reddedildi!",
          const Icon(LineIcons.times, color: Colors.red));
    } else {
      Navigator.pop(context);

      Utils.showDefaultSnackbar(
          context,
          data.message!,
          const Icon(
            LineIcons.times,
            color: Colors.red,
          ));
    }
  }

  bool valideForm() {
    bool check = true;
    if (_formKey.currentState!.validate()) {
      check = true;
    } else {
      Utils.showDefaultSnackbar(
          context, "Lütfen Gerekli Alanları Doldurun!", null);
           check = false;
      return check;
    }
    if (widget.task.isRequiredImage!) {
      if (images.isEmpty) {
        Utils.showDefaultSnackbar(context, "Lütfen Resim Ekleyin!", null);
        check = false;
        return check;
      }
    }
    if (widget.task.isRequiredVideo!) {
      if (videos.isEmpty) {
        Utils.showDefaultSnackbar(context, "Lütfen Video Ekleyin!", null);
        check = false;
        return check;
      }
    }
    if (widget.task.isRequiredFile!) {
      if (files.isEmpty) {
        Utils.showDefaultSnackbar(context, "Lütfen Dosya Ekleyin!", null);
        check = false;
        return check;
      }
    }
    return check;
  }

  Widget getButton() {
    if (widget.task.eventStatusValue!.isDefault != null &&
        widget.task.eventStatusValue!.isDefault!) {
      return ElevatedButton(
          onPressed: () {
            startTask(widget.task, context);
          },
          child: const Text("BAŞLAT"));
    } else if (widget.task.eventStatusValue!.isActive != null &&
        widget.task.eventStatusValue!.isActive!) {
      if (widget.task.isRelatedContactApprovalRequired! ||
          widget.task.isAuditorApprovalRequired!) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Utils.hexOrRGBToColor(
                    widget.task.eventStatusValue!.colorCode!)),
            onPressed: () {
              var check = valideForm();
              if (check) {
                submitTaskForApproval(widget.task, context);
              }
            },
            child: const Text("Onay İste"));
      } else if (widget.task.eventStatusValue!.isExpired != null &&
          widget.task.eventStatusValue!.isExpired!) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Utils.hexOrRGBToColor(
                    widget.task.eventStatusValue!.colorCode!)),
            onPressed: () {
              startTask(widget.task, context);
            },
            child: const Text("Gecikmeli Başlat"));
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              onPressed: () {
                bool check = valideForm();
                if (check) {
                  editTask(widget.task, context);
                }
              },
              child: const Text("Değişiklikleri Kaydet")),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Utils.hexOrRGBToColor(
                      widget.task.eventStatusValue!.colorCode!)),
              onPressed: () {
                var check = valideForm();
                if (check) {
                  completeTask(widget.task, context);
                }
              },
              child: const Text("Görevi Tamamla"))
        ],
      );
    } else if (widget.task.eventStatusValue!.isWaitingApproval != null &&
        widget.task.eventStatusValue!.isWaitingApproval!) {
      if (widget.isAuthorized) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  approveTask(widget.task, context);
                },
                child: const Text("Görevi Onayla")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  rejectTask(widget.task, context);
                },
                child: const Text("Görevi Reddet")),
          ],
        );
      }
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Utils.hexOrRGBToColor(
                  widget.task.eventStatusValue!.colorCode!)),
          onPressed: () {},
          child: const Text("Onay Bekleniyor"));
    }
    return const SizedBox();
  }

  @override
  void initState() {
    super.initState();
    if (widget.task.startDate != null) {
      startDate = DateTime.parse(widget.task.startDate!);
      startDateController.text = DateFormat("d.MM.yyyy").format(startDate!);
    } else {
      startDateController.text = "Belirlenmedi";
    }
    if (widget.task.endDate != null) {
      endDate = DateTime.parse(widget.task.endDate!);
      endDateController.text = DateFormat("d.MM.yyyy HH:mm").format(endDate!);
    } else {
      endDateController.text = "Belirlenmedi";
    }
    if (widget.task.taskProgress! > 0) {
      taskPercent = widget.task.taskProgress!.toDouble();
    }

    dropdownValue = taskStatusList.first;
    if (widget.task.ritmaDriveFolderId != null) {
      API
          .getDriveFilebyId(
              widget.task.ritmaDriveFolderId!, widget.task.primaryId!)
          .then((value) {
        for (var item in value.data!) {
          switch (item.fileTypeId) {
            case FileTypeIds.IMAGE:
              XFile file = XFile(item.url!, name: item.name, mimeType: item.id);
              setState(() {
                images.add(file);
              });
              break;
            case FileTypeIds.VIDEO:
              XFile file = XFile(item.url!, name: item.name, mimeType: item.id);
              setState(() {
                videos.add(file);
              });
              break;

            default:
              List<PlatformFile> loaddedfiles = [
                PlatformFile(
                    path: item.url,
                    name: item.name!,
                    size: item.fileSizeInBytes!,
                    identifier: item.id)
              ];
              FilePickerResult file = FilePickerResult(loaddedfiles);
              setState(() {
                files.add(file);
              });
          }
        }
      });
    } else {
      API.getDriveNewFolder(widget.task).then((value) async {
        setState(() {
          widget.task.ritmaDriveFolderId = value;
        });
        await API.workStepEdit(widget.task);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(LineIcons.angleLeft, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.task.name != null ? widget.task.name! : "İsim Girilmedi",
              style: const TextStyle(color: Colors.black),
            ),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      color: Utils.hexOrRGBToColor(
                          widget.task.eventStatusValue!.colorCode!),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.task.workStepName!,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Wrap(
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 2) - 8,
                  child: BoxTile(
                    margin: const EdgeInsets.only(bottom: 8),
                    title: TextFormField(
                      readOnly: true,
                      controller: startDateController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'BAŞLANGIÇ TARİHİ',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 2) - 8,
                  child: BoxTile(
                    margin: const EdgeInsets.only(bottom: 8, left: 8),
                    title: TextFormField(
                      readOnly: true,
                      controller: endDateController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'BİTİŞ TARİHİ',
                      ),
                    ),
                  ),
                )
              ],
            ),
            parse(widget.task.description!).documentElement!.text.isNotEmpty
                ? BoxTile(
                    margin: const EdgeInsets.only(bottom: 8),
                    title: Text(
                        parse(widget.task.description!).documentElement!.text))
                : const SizedBox(),
            widget.task.eventStatusValue!.isDefault == false ||
                    widget.task.eventStatusValue!.isDefault == null
                ? BoxTile(
                    margin: const EdgeInsets.only(bottom: 8),
                    title: TextFormField(
                      maxLines: 5,
                      minLines: 1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen Geçerli bir Açıklama Giriniz';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        widget.task.description = value;
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Açıklama',
                          hintText: "Açıklama Giriniz"),
                    ),
                  )
                : const SizedBox(),
            widget.task.eventStatusValue!.isDefault == false ||
                    widget.task.eventStatusValue!.isDefault == null
                ? BoxTile(
                    onTap: () {},
                    padding: EdgeInsets.zero,
                    margin: const EdgeInsets.only(bottom: 8),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0)
                              .copyWith(bottom: 0, left: 20),
                          child: Text(
                            "YAPILAN GÖREVİN YÜZDESİ",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade700),
                          ),
                        ),
                        Slider(
                          max: 100,
                          min: 0,
                          value: taskPercent,
                          divisions: 10,
                          label: "$taskPercent",
                          activeColor: Utils.hexOrRGBToColor(
                              widget.task.eventStatusValue!.colorCode!),
                          inactiveColor: Utils.hexOrRGBToColor(
                                  widget.task.eventStatusValue!.colorCode!)
                              .withOpacity(0.2),
                          onChanged: (value) {
                            setState(() {
                              taskPercent = value;
                              widget.task.taskProgress = value.toInt();
                            });
                          },
                        ),
                      ],
                    ))
                : const SizedBox(),
            widget.task.eventStatusValue!.isDefault == false ||
                    widget.task.eventStatusValue!.isDefault == null
                ? BoxTile(
                    trailing: TextButton(
                      onPressed: () async {
                        XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (image != null) {
                          uploadImage(image);
                        }
                      },
                      child: Wrap(
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: const [
                          Text("Yükle"),
                          SizedBox(width: 10),
                          Icon(
                            LineIcons.plus,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 8),
                    title: const Text(
                      "Fotoğraflar",
                    ),
                  )
                : const SizedBox(),
            for (var image in images)
              BoxTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        _launchUrl(image.path);
                      },
                      icon: const Icon(LineIcons.download),
                    ),
                    IconButton(
                      onPressed: () {
                        deleteFile(image.mimeType!).then((value) {
                          setState(() {
                            images.remove(image);
                          });
                        });
                      },
                      icon: const Icon(LineIcons.times),
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(bottom: 8),
                title: Text(
                  image.name,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                ),
              ),
            widget.task.eventStatusValue!.isDefault == false ||
                    widget.task.eventStatusValue!.isDefault == null
                ? BoxTile(
                    trailing: TextButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();
                        if (result != null) {
                          uploadFile(result);
                        }
                      },
                      child: Wrap(
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: const [
                          Text("Yükle"),
                          SizedBox(width: 10),
                          Icon(
                            LineIcons.plus,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 8),
                    title: const Text(
                      "Dosyalar",
                    ),
                  )
                : const SizedBox(),
            for (var file in files)
              BoxTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        _launchUrl(file.files.first.path);
                      },
                      icon: const Icon(LineIcons.download),
                    ),
                    IconButton(
                      onPressed: () {
                        deleteFile(file.files.first.identifier!).then((value) {
                          setState(() {
                            files.remove(file);
                          });
                        });
                      },
                      icon: const Icon(LineIcons.times),
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(bottom: 8),
                title: Text(
                  file.files.first.name,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                ),
              ),
            widget.task.eventStatusValue!.isDefault == false ||
                    widget.task.eventStatusValue!.isDefault == null
                ? BoxTile(
                    trailing: TextButton(
                      onPressed: () async {
                        XFile? video = await _picker.pickVideo(
                            source: ImageSource.camera,
                            preferredCameraDevice: CameraDevice.rear,
                            maxDuration: const Duration(seconds: 30));

                        if (video != null) {
                          uploadVideo(video);
                        }
                      },
                      child: Wrap(
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: const [
                          Text("Yükle"),
                          SizedBox(width: 10),
                          Icon(
                            LineIcons.plus,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 8),
                    title: const Text("Videolar"))
                : const SizedBox(),
            for (var video in videos)
              BoxTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        _launchUrl(video.path);
                      },
                      icon: const Icon(LineIcons.download),
                    ),
                    IconButton(
                      onPressed: () {
                        deleteFile(video.mimeType!).then((value) {
                          setState(() {
                            videos.remove(video);
                          });
                        });
                      },
                      icon: const Icon(LineIcons.times),
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(bottom: 8),
                title: Text(
                  video.name,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                ),
              ),
            getButton(),
          ],
        ),
      ),
    );
  }
}
