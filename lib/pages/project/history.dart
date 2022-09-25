import 'package:cilekhavuz/pages/shared/boxtile.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timelines/timelines.dart';

class ProjectHistory extends StatefulWidget {
  const ProjectHistory({Key? key}) : super(key: key);

  @override
  State<ProjectHistory> createState() => _ProjectHistoryState();
}

class _ProjectHistoryState extends State<ProjectHistory> {
  List<String> data = [
    "Bülent Çobanoğlu ile 'Ödeme' konulu bir #görüşme yaptı.Çiğdem Kaya Satış Temsilcisi",
    "Medical Park ile flex satışı için görüşme Uğur Büyükalkan ve Eyüp Öztürk ile birlikte",
    "#Teklif fiyatı ₺ 23.600 olarak değiştirildi. Çiğdem Kaya Satış Temsilcisi",
    "₺ 21.600 tutarında #teklif oluşturdu. Uğur Büyükalkan Gurutek, Yönetici"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(14), shrinkWrap: true, children: [
      Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                right: BorderSide(color: Colors.grey.shade200, width: 1),
                top: BorderSide(color: Colors.grey.shade200, width: 1),
                bottom: BorderSide(color: Colors.grey.shade200, width: 1),
                left: BorderSide(color: Colors.grey.shade200, width: 1))),
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FixedTimeline.tileBuilder(
                theme: TimelineThemeData(
                  indicatorTheme: const IndicatorThemeData(
                    size: 20.0,
                  ),
                  connectorTheme: const ConnectorThemeData(
                    thickness: 2.5,
                  ),
                ),
                builder: TimelineTileBuilder.connected(
                  nodePositionBuilder: (context, index) => 0,
                  contentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(data[index]),
                  ),
                  indicatorBuilder: (_, index) {
                    return const OutlinedDotIndicator(
                      borderWidth: 2.5,
                    );
                  },
                  connectorBuilder: (_, index, ___) => const SolidLineConnector(),
                  itemCount: 4,
                ))),
      ),
    ]);
  }
}
