import 'package:cilekhavuz/pages/shared/boxtile.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ProjectInterviews extends StatefulWidget {
  const ProjectInterviews({Key? key}) : super(key: key);
  @override
  State<ProjectInterviews> createState() => _ProjectInterviewsState();
}

class _ProjectInterviewsState extends State<ProjectInterviews> {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(14), children: [
      BoxTile(
          margin: const EdgeInsets.only(bottom: 10),
          dense: true,
          title: Padding(
            padding: const EdgeInsets.all(14.0).copyWith(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(LineIcons.phone, color: Color(0xff009ef7)),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'TELEFON',
                      style: TextStyle(color: Color(0xff009ef7), fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  "Çiğdem Kaya Satış Temsilcisi",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text("Bülent Çobanoğlu ile 'Ödeme' konulu bir #görüşme yaptı.", maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "2 Eylül 11:45",
                ),
              ],
            ),
          )),
      BoxTile(
        margin: const EdgeInsets.only(bottom: 10),
        dense: true,
        onTap: () {},
        title: Padding(
          padding: const EdgeInsets.all(14.0).copyWith(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(LineIcons.users, color: Color(0xff009ef7)),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'YÜZ YÜZE',
                    style: TextStyle(color: Color(0xff009ef7), fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const Text(
                "Uğur Büyükalkan ve Eyüp Öztürk ile birlikte",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text("Medical Park ile flex satışı için görüşme", maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "2 Eylül 11:45",
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
