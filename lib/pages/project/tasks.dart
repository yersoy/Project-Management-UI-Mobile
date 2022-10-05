import 'package:cilekhavuz/models/ModuleTasks.dart';
import 'package:cilekhavuz/pages/project/task.dart';
import 'package:cilekhavuz/pages/shared/boxtile.dart';
import 'package:cilekhavuz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<Widget> workGroup1(context) {
    return [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Task(
                      task: new ModuleTasks(),
                      isAuthorized: true,
                    )),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(12).copyWith(top: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  right: BorderSide(color: Colors.grey.shade200, width: 1),
                  top: BorderSide(color: Colors.grey.shade200, width: 1),
                  bottom: BorderSide(color: Colors.grey.shade200, width: 1),
                  left: const BorderSide(color: Colors.green, width: 5))),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircularPercentIndicator(
                      animation: true,
                      animationDuration: 2000,
                      radius: 15.0,
                      lineWidth: 3.0,
                      percent: 1.0,
                      progressColor: Colors.green,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6).copyWith(left: 12, right: 12),
                      child: const Text(
                        'TAMAMLANDI',
                        style: TextStyle(color: Color(0xff50cd89), fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  "Mikserlerin Getirilmesi",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                    "Mikserlerin Taşıyıcıya yüklenip inşaat alanına gerekli yerlere transfer edilmesi ve yakıt elektririk gibi kaynakların sağlanıp çalışmaya hazır hale getirilmesi.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "2 Eylül 11:45",
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(12).copyWith(top: 0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                right: BorderSide(color: Colors.grey.shade200, width: 1),
                top: BorderSide(color: Colors.grey.shade200, width: 1),
                bottom: BorderSide(color: Colors.grey.shade200, width: 1),
                left: const BorderSide(color: Color(0xff009ef7), width: 5))),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircularPercentIndicator(
                    animation: true,
                    animationDuration: 2000,
                    radius: 15.0,
                    lineWidth: 3.0,
                    percent: .5,
                    progressColor: const Color(0xff009ef7),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6).copyWith(left: 12, right: 12),
                    child: const Text(
                      'AKTİF',
                      style: TextStyle(color: Color(0xff009ef7), fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const Text(
                "Mikserlerin Getirilmesi",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                  "Mikserlerin Taşıyıcıya yüklenip inşaat alanına gerekli yerlere transfer edilmesi ve yakıt elektririk gibi kaynakların sağlanıp çalışmaya hazır hale getirilmesi.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "2 Eylül 11:45",
              ),
            ],
          ),
        ),
      ),
    ];
  }

  List<Widget> workGroup2 = [
    Container(
      margin: const EdgeInsets.all(12).copyWith(top: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              right: BorderSide(color: Colors.grey.shade200, width: 1),
              top: BorderSide(color: Colors.grey.shade200, width: 1),
              bottom: BorderSide(color: Colors.grey.shade200, width: 1),
              left: const BorderSide(color: Colors.grey, width: 5))),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircularPercentIndicator(
                  animation: true,
                  animationDuration: 2000,
                  radius: 15.0,
                  lineWidth: 3.0,
                  percent: .0,
                  progressColor: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(6).copyWith(left: 12, right: 12),
                  child: const Text(
                    'HENÜZ BAŞLANMADI',
                    style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "İşin Son ilerleme denetimi",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text("Yapılan Çalışmanın yerinde ve usülünde yapıldığı kontrol edilecek.", maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "2 Eylül 11:45",
            ),
          ],
        ),
      ),
    ),
  ];
  List<Widget> workGroup3 = [
    Container(
      margin: const EdgeInsets.all(12).copyWith(top: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              right: BorderSide(color: Colors.grey.shade200, width: 1),
              top: BorderSide(color: Colors.grey.shade200, width: 1),
              bottom: BorderSide(color: Colors.grey.shade200, width: 1),
              left: const BorderSide(color: Colors.grey, width: 5))),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircularPercentIndicator(
                  animation: true,
                  animationDuration: 2000,
                  radius: 15.0,
                  lineWidth: 3.0,
                  percent: .0,
                  progressColor: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(6).copyWith(left: 12, right: 12),
                  child: const Text(
                    'HENÜZ BAŞLANMADI',
                    style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "İşin Son ilerleme denetimi",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Yapılan Çalışmanın yerinde ve usülünde yapıldığı kontrol edilecek.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "2 Eylül 11:45",
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(14),
      children: [
        BoxTile(
          expanded: true,
          title: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(color: Color(0xff4800ff), borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "BETON ATMA",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          children: workGroup1(context),
        ),
        BoxTile(
          margin: const EdgeInsets.only(top: 15),
          expanded: false,
          title: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(color: Color(0xff00b8d4), borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "KURUMSAL DENETİM",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          children: workGroup2,
        ),
        BoxTile(
          margin: const EdgeInsets.only(top: 15),
          expanded: false,
          title: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(color: Color(0xff0168fa), borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "ZEMİN ETÜDÜ",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          children: workGroup3,
        )
      ],
    );
  }
}
