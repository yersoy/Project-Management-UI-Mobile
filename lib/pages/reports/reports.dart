import 'package:badges/badges.dart';
import 'package:cilekhavuz/pages/shared/boxtile.dart';
import 'package:cilekhavuz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../shared/header.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  final List<ChartData> chartData = [
    ChartData('Tamamlanan', 12, Colors.green),
    ChartData('Yapılacak', 8, Colors.blue),
    ChartData('Gelecek', 18, Colors.grey.shade100),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(14),
      shrinkWrap: true,
      children: [
        const Header(title: "Rapor"),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey[200]!, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                legend: Legend(
                  isVisible: false,
                  position: LegendPosition.bottom,
                  textStyle: GoogleFonts.quicksand(),
                ),
                series: <ChartSeries>[
                  ColumnSeries<ChartData, String>(
                      dataLabelSettings: DataLabelSettings(
                          textStyle: GoogleFonts.quicksand(), isVisible: true),
                      dataLabelMapper: (ChartData data, _) =>
                          data.y.toStringAsFixed(0),
                      dataSource: chartData,
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y),
                ]),
          ),
        ),
        Header(
          title: "Tamamlanan Projeler",
          trailing: Container(
              padding: const EdgeInsets.all(8).copyWith(top: 4,bottom: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.green,
            ),
            child: const Text(
              "8",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        BoxTile(
          margin: const EdgeInsets.only(bottom: 12),
          onTap: () {
            Navigator.pushNamed(context, Routes.PROJECTS);
          },
          leading: Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(4)),
            width: 40,
            height: 40,
            child: const Center(
              child: Text(
                "MT",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          title: Wrap(
            direction: Axis.vertical,
            children: const [
              Text(
                "Bilişim Vadisi Hamam Projesi",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Bilişim Vadisi Sanayi Ticaret Limited Şirketi",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        BoxTile(
          margin: const EdgeInsets.only(bottom: 12),
          onTap: () {
            Navigator.pushNamed(context, Routes.PROJECTS);
          },
          leading: Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(4)),
            width: 40,
            height: 40,
            child: const Center(
              child: Text(
                "ŞT",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          title: Wrap(
            direction: Axis.vertical,
            children: const [
              Text(
                "İstanbul Park Evleri Sitesi Havuz Projesi",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Ritma Teknoloji Sanayi ve Ticaret Limited Şirketi",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        BoxTile(
          margin: const EdgeInsets.only(bottom: 12),
          onTap: () {
            Navigator.pushNamed(context, Routes.PROJECTS);
          },
          leading: Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey, borderRadius: BorderRadius.circular(4)),
            width: 40,
            height: 40,
            child: const Center(
              child: Text(
                "MA",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          title: Wrap(
            direction: Axis.vertical,
            children: const [
              Text(
                "Cevik Yapı Hamam ve Sauna Projesi",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Cilek Havuz Sanayi ve Ticaret Limited Sirketi",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        Header(
          title: "Bekleyen Projeler",
          trailing: Container(
            padding: const EdgeInsets.all(8).copyWith(top: 4,bottom: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.blue,
            ),
            child: const Text(
              "12",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        BoxTile(
          margin: const EdgeInsets.only(bottom: 12),
          onTap: () {
            Navigator.pushNamed(context, Routes.PROJECTS);
          },
          leading: Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(4)),
            width: 40,
            height: 40,
            child: const Center(
              child: Text(
                "MT",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          title: Wrap(
            direction: Axis.vertical,
            children: const [
              Text(
                "Bilişim Vadisi Hamam Projesi",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Bilişim Vadisi Sanayi Ticaret Limited Şirketi",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        BoxTile(
          margin: const EdgeInsets.only(bottom: 12),
          onTap: () {
            Navigator.pushNamed(context, Routes.PROJECTS);
          },
          leading: Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(4)),
            width: 40,
            height: 40,
            child: const Center(
              child: Text(
                "ŞT",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          title: Wrap(
            direction: Axis.vertical,
            children: const [
              Text(
                "İstanbul Park Evleri Sitesi Havuz Projesi",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Ritma Teknoloji Sanayi ve Ticaret Limited Şirketi",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        BoxTile(
          margin: const EdgeInsets.only(bottom: 12),
          onTap: () {
            Navigator.pushNamed(context, Routes.PROJECTS);
          },
          leading: Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey, borderRadius: BorderRadius.circular(4)),
            width: 40,
            height: 40,
            child: const Center(
              child: Text(
                "MA",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          title: Wrap(
            direction: Axis.vertical,
            children: const [
              Text(
                "Cevik Yapı Hamam ve Sauna Projesi",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Cilek Havuz Sanayi ve Ticaret Limited Sirketi",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
