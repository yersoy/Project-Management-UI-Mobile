import 'package:badges/badges.dart';
import 'package:cilekhavuz/pages/shared/boxtile.dart';
import 'package:cilekhavuz/pages/shared/header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Summary extends StatefulWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  final List<ChartData> chartData = [
    ChartData('Tam.', 25, Colors.green),
    ChartData('Aktif', 38, Colors.blue),
    ChartData('Baş.', 34, Colors.grey),
    ChartData('Zaman Aş.', 2, Colors.red),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      children: [
        SfCircularChart(
            legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              textStyle: GoogleFonts.quicksand(),
            ),
            series: <CircularSeries>[
              // Renders doughnut chart
              DoughnutSeries<ChartData, String>(
                  dataSource: chartData,
                  explode: true,
                  explodeIndex: 0,
                  pointColorMapper: (ChartData data, _) => data.color,
                  dataLabelSettings:
                      DataLabelSettings(textStyle: GoogleFonts.quicksand(), isVisible: true, labelPosition: ChartDataLabelPosition.outside),
                  dataLabelMapper: (ChartData data, _) => "${data.y.toStringAsFixed(0)} Görev",
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y)
            ]),
        const ListTile(
            title: Text(
              "Günlük İş Listesi",
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(LineIcons.angleRight)),
        Container(
          margin: const EdgeInsets.all(12).copyWith(top: 4),
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
        Container(
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
