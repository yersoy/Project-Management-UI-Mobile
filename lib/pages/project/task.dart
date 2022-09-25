import 'package:cilekhavuz/models/tasktatus.dart';
import 'package:cilekhavuz/pages/shared/boxtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  DateTime startDate = DateTime.parse("2022-02-02 00:00:00");
  DateTime endDate = DateTime.parse("2022-09-27 13:27:00");

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  bool _switchValue = false;

  YoutubePlayerController? _controller;

  double taskPercent = 50.0;
  
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
    startDateController.text = DateFormat("d.MM.yyyy").format(startDate);
    endDateController.text = DateFormat("d.MM.yyyy HH:mm").format(endDate);
    _controller = YoutubePlayerController(
      flags: const YoutubePlayerFlags(autoPlay: false),
      initialVideoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=YXa8qsC5xws&ab_channel=howtopaintinfo")!,
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
            const Text(
              "Mikserlerin Getirilmesi",
              style: TextStyle(color: Colors.black),
            ),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(color: Color(0xff4800ff), borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  "BETON ATMA",
                  style: TextStyle(color: Colors.black, fontSize: 12),
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
                      labelText: 'Başlangıç Tarihi',
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
                      labelText: 'Bitiş Tarihi',
                    ),
                  ),
                ),
              )
            ],
          ),
          BoxTile(
            margin: const EdgeInsets.only(bottom: 8),
            title: TextFormField(
              maxLines: 5,
              initialValue:
                  "Duvarları boyamadan önce pürüzler giderildi.Alçı ile delikler kapatıldı ve temiz bir çalışma alanı oluşturuldukdan sonra duvarlar önce beyaza sonrada maviye boyandı. Kuruması için 24 Saat Gerekli.",
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: 'Açıklama',
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
                    padding: const EdgeInsets.all(14.0).copyWith(bottom: 0, left: 20),
                    child: Text(
                      "Görev Yüzdesi",
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                    ),
                  ),
                  Slider(
                    max: 100,
                    min: 0,
                    value: taskPercent,
                    divisions: 10,
                    label: "$taskPercent",
                    activeColor: dropdownValue!.color,
                    onChanged: (value) {
                      setState(() {
                        taskPercent = value;
                      });
                    },
                  ),
                ],
              )),
          BoxTile(
            onTap: () async { XFile? image = await _picker.pickImage(source: ImageSource.gallery);},
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.only(bottom: 8),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0).copyWith(bottom: 0, left: 20),
                  child: Text(
                    "Havuzun Önden Fotoğrafı",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0).copyWith(left: 20),
                  child: const Text("havuz-ön-fotograf.png"),
                ),
              ],
            ),
          ),
          BoxTile(
           onTap: () async { XFile? image = await _picker.pickImage(source: ImageSource.gallery);},
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.only(bottom: 8),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0).copyWith(bottom: 0, left: 20),
                  child: Text(
                    "Havuzun Üstden Fotoğrafı",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0).copyWith(left: 20),
                  child: const Text("havuz-üst-fotograf.jpeg"),
                ),
              ],
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
          ElevatedButton(style: ElevatedButton.styleFrom(primary: dropdownValue?.color), onPressed: () {}, child: const Text("Onaya Gönder"))
        ],
      ),
    );
  }
}
