import 'package:cilekhavuz/models/ModuleTasks.dart';
import 'package:cilekhavuz/models/tasktatus.dart';
import 'package:cilekhavuz/pages/shared/boxtile.dart';
import 'package:cilekhavuz/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Task extends StatefulWidget {
  final ModuleTasks task;
  const Task({Key? key, required this.task}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  DateTime? startDate;
  DateTime? endDate;

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  bool _switchValue = false;

  YoutubePlayerController? _controller;

  double taskPercent = 0.0;

  TaskStatus? dropdownValue;
  final ImagePicker _picker = ImagePicker();
  List<TaskStatus> taskStatusList = [
    TaskStatus(color: const Color(0xff50cd89), name: "Tamamlandı"),
    TaskStatus(color: const Color(0xff009ef7), name: "Yapım Aşamasında"),
    TaskStatus(color: const Color(0xffe79da4), name: "Süresi Geçmiş"),
    TaskStatus(color: Colors.grey, name: "Henüz Başlanmadı"),
  ];

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
    _controller = YoutubePlayerController(
      flags: const YoutubePlayerFlags(autoPlay: false),
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=YXa8qsC5xws&ab_channel=howtopaintinfo")!,
    );
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
              widget.task.name!,
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
      body: ListView(
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
          BoxTile(
            margin: const EdgeInsets.only(bottom: 8),
            title: TextFormField(
              maxLines: 5,
              minLines: 1,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: 'Açıklama Giriniz',
              ),
            ),
          ),
          BoxTile(
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
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade700),
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
                      });
                    },
                  ),
                ],
              )),
          BoxTile(
            onTap: () async {
              XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);
            },
            trailing: IconButton(
              onPressed: () async {
                XFile? image =
                    await _picker.pickImage(source: ImageSource.gallery);
              },
              icon: const Icon(
                LineIcons.plus,
                color: Colors.blue,
              ),
            ),
            margin: const EdgeInsets.only(bottom: 8),
            title: const Text(
              "Fotoğraflar",
            ),
          ),
          BoxTile(
            onTap: () async {
              XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);
            },
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(LineIcons.times),
            ),
            margin: const EdgeInsets.only(bottom: 8),
            title: Text(
              "camera-2352-26.09.2022.jpg",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
          ),
          BoxTile(
            onTap: () async {
              XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);
            },
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(LineIcons.times),
            ),
            margin: const EdgeInsets.only(bottom: 8),
            title: Text(
              "camera-2346-26.09.2022.jpg",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
          ),
          BoxTile(
            margin: const EdgeInsets.only(bottom: 8),
            title: TextFormField(
              initialValue: "https://www.youtube.com/watch?v=dZQ_0ErQ0ec",
              decoration: const InputDecoration(
                hintText: "https://www.youtube.com/watch?v=dZQ_0ErQ0ec",
                border: InputBorder.none,
                labelText: 'Video URL (YOUTUBE)',
              ),
            ),
            children: [
              YoutubePlayer(
                controller: _controller!,
                liveUIColor: Colors.red,
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Utils.hexOrRGBToColor(
                      widget.task.eventStatusValue!.colorCode!)),
              onPressed: () {},
              child: Text(widget.task.eventStatusValue!.name != null
                  ? widget.task.eventStatusValue!.name!
                  : "Tamamla"))
        ],
      ),
    );
  }
}
