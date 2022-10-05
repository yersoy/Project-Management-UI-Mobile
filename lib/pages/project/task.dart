import 'package:cilekhavuz/api/api.dart';
import 'package:cilekhavuz/api/base.dart';
import 'package:cilekhavuz/models/AuthModel.dart';
import 'package:cilekhavuz/models/ModuleTasks.dart';
import 'package:cilekhavuz/models/Person.dart';
import 'package:cilekhavuz/models/tasktatus.dart';
import 'package:cilekhavuz/pages/shared/boxtile.dart';
import 'package:cilekhavuz/utils/constants.dart';
import 'package:cilekhavuz/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
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

  Future editTask(ModuleTasks task, context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    bool check = await API.workStepEdit(task);
    if (check) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.of(context).pushReplacementNamed(Routes.DASHBOARD);
      Utils.showDefaultSnackbar(context, "Görev Başarıyla Güncellendi!",
          const Icon(Icons.check, color: Colors.green));
      return check;
    } else {
      Utils.showDefaultSnackbar(
          context,
          "Görev Güncellenemedi",
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
    bool check = await API.workStepStart(task);
    if (check) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.of(context).pushReplacementNamed(Routes.DASHBOARD);
      Utils.showDefaultSnackbar(context, "Görev Başarıyla Başlatıldı!",
          const Icon(Icons.check, color: Colors.green));
    } else {
      Navigator.pop(context);

      Utils.showDefaultSnackbar(
          context,
          "Görev Başlatılamadı",
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

    bool check = await API.workStepComplete(task);
    if (check) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.of(context).pushReplacementNamed(Routes.DASHBOARD);
      Utils.showDefaultSnackbar(context, "Görev Başarıyla Tamamlandı!",
          const Icon(Icons.check, color: Colors.green));
    } else {
      Navigator.pop(context);

      Utils.showDefaultSnackbar(
          context,
          "Görev Tamamlanamadı",
          const Icon(
            Icons.check,
            color: Colors.green,
          ));
    }
  }

  Future approveTask(ModuleTasks task, context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    bool check = await API.workStepApproveTask(task);
    if (check) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.of(context).pushReplacementNamed(Routes.DASHBOARD);
      Utils.showDefaultSnackbar(context, "Görev Başarıyla Onaylandı!",
          const Icon(Icons.check, color: Colors.green));
    } else {
      Navigator.pop(context);

      Utils.showDefaultSnackbar(
          context,
          "Görev Onaylanamadı!",
          const Icon(
            Icons.check,
            color: Colors.green,
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
    bool check = await API.workStepSubmitForApprove(task);
    if (check) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.of(context).pushReplacementNamed(Routes.DASHBOARD);
      Utils.showDefaultSnackbar(context, "Görev onaya gönderildi!",
          const Icon(Icons.check, color: Colors.green));
    } else {
      Navigator.pop(context);

      Utils.showDefaultSnackbar(
          context,
          "Görev Onaya Gönderilemedi!",
          const Icon(
            Icons.check,
            color: Colors.green,
          ));
    }
  }

  Future rejectTask(ModuleTasks task, context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    bool check = await API.workStepRejectTask(task);
    if (check) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.of(context).pushReplacementNamed(Routes.DASHBOARD);
      Utils.showDefaultSnackbar(context, "Görev Reddedildi!",
          const Icon(LineIcons.times, color: Colors.red));
    } else {
      Navigator.pop(context);

      Utils.showDefaultSnackbar(
          context,
          "Görev Red Olmadı!",
          const Icon(
            LineIcons.times,
            color: Colors.red,
          ));
    }
  }

  bool valideForm() {
    if (widget.task.isRequiredImage!) {
      if (images.isEmpty) {
        Utils.showDefaultSnackbar(context, "Lütfen Resim Ekleyin!", null);
        return false;
      }
      return true;
    } else if (widget.task.isRequiredVideo!) {
      if (videos.isEmpty) {
        Utils.showDefaultSnackbar(context, "Lütfen Video Ekleyin!", null);
        return false;
      }
      return true;
    } else if (widget.task.isRequiredFile!) {
      if (files.isEmpty) {
        Utils.showDefaultSnackbar(context, "Lütfen Dosya Ekleyin!", null);
        return false;
      }
      return true;
    }
    if (_formKey.currentState!.validate()) {
      return true;
    } else {
      Utils.showDefaultSnackbar(
          context, "Lütfen Gerekli Alanları Doldurun!", null);
    }
    return false;
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
              submitTaskForApproval(widget.task, context);
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
                completeTask(widget.task, context);
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
                          setState(() {
                            images.add(image);
                          });
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
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      images.remove(image);
                    });
                  },
                  icon: const Icon(LineIcons.times),
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
                        setState(() {
                          files.add(result!);
                        });
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
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      files.remove(file);
                    });
                  },
                  icon: const Icon(LineIcons.times),
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
                          setState(() {
                            videos.add(video);
                          });
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
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      videos.remove(video);
                    });
                  },
                  icon: const Icon(LineIcons.times),
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
