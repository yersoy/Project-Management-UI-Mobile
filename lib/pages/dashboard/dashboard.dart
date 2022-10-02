import 'package:cilekhavuz/api/api.dart';
import 'package:cilekhavuz/models/ModuleTasks.dart';
import 'package:cilekhavuz/pages/project/task.dart';
import 'package:cilekhavuz/pages/shared/header.dart';
import 'package:cilekhavuz/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:html/parser.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<ChartData> chartData = [
    ChartData('Tamamlanan', 35, Colors.green),
    ChartData('Yapılacak', 52, Colors.blue),
    ChartData('Gelecek', 48, Colors.grey.shade100),
  ];
  late Future<List<ModuleTasks>> data;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    data = API.workSteps();
  }

  Widget taskWidget(ModuleTasks item) {
    Color? statusColor =
        Utils.hexOrRGBToColor(item.eventStatusValue!.colorCode!);

    return Container(
      margin: const EdgeInsets.all(12).copyWith(top: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              right: BorderSide(color: Colors.grey.shade200, width: 1),
              top: BorderSide(color: Colors.grey.shade200, width: 1),
              bottom: BorderSide(color: Colors.grey.shade200, width: 1),
              left: BorderSide(color: statusColor, width: 5))),
      child: Material(
        child: InkWell(
          onTap: () {
            Future.delayed(const Duration(milliseconds: 300), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Task(task: item)),
              );
            });
          },
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
                      percent: item.taskProgress != -1
                          ? (item.taskProgress! / 100)
                          : 0,
                      progressColor: statusColor,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.all(6).copyWith(left: 12, right: 12),
                      child: Text(
                        item.eventStatusName!,
                        style: TextStyle(
                            color: statusColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  item.name!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(item.workStepName!,
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                item.startDate != null
                    ? const SizedBox(
                        height: 12,
                      )
                    : const SizedBox(),
                item.startDate != null
                    ? Text(DateFormat('dd MMMM yyyy HH:mm', "tr")
                        .format(DateTime.parse(item.startDate!)))
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ListView(
  //     padding: const EdgeInsets.all(14),
  //     shrinkWrap: true,
  //     children: [
  //       Header(
  //         title: "Projeler",
  //         trailing: IconButton(onPressed: () {}, icon: const Icon(LineIcons.search)),
  //       ),
  //       GestureDetector(
  //         onTap: () {
  //           Navigator.pushNamed(context, Routes.PROJECTS);
  //         },
  //         child: Card(
  //           elevation: 0,
  //           shape: RoundedRectangleBorder(
  //             side: BorderSide(color: Colors.grey[200]!, width: 1),
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: <Widget>[
  //               const SizedBox(height: 12),
  //               Padding(
  //                 padding: const EdgeInsets.all(14.0).copyWith(bottom: 4, top: 4),
  //                 child: Row(
  //                   children: [
  //                     Container(
  //                       decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
  //                       width: 40,
  //                       height: 40,
  //                       child: const Center(
  //                         child: Text(
  //                           "ŞT",
  //                           style: TextStyle(color: Colors.white),
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       width: 10,
  //                     ),
  //                     Wrap(
  //                       direction: Axis.vertical,
  //                       children: const [
  //                         Text(
  //                           "İstanbul Park Evleri Sitesi Havuz Projesi",
  //                           style: TextStyle(fontSize: 15),
  //                         ),
  //                         Text(
  //                           "Ritma Teknoloji Sanayi ve Ticaret Limited Şirketi",
  //                           style: TextStyle(fontSize: 12, color: Colors.grey),
  //                         ),
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(16.0).copyWith(bottom: 4, top: 8),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   mainAxisSize: MainAxisSize.max,
  //                   children: [
  //                     Wrap(
  //                       direction: Axis.vertical,
  //                       children: const [
  //                         Text(
  //                           "₺ 238.000",
  //                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //                         ),
  //                         Text(
  //                           "Bütçe",
  //                           style: TextStyle(fontSize: 12),
  //                         ),
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(14.0).copyWith(bottom: 4, top: 4),
  //                 child: const Text(
  //                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam consequat, eros sed venenatis sagittis, mi ligula ultrices justo.",
  //                   style: TextStyle(fontSize: 12, color: Colors.grey),
  //                 ),
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: <Widget>[
  //                   Padding(
  //                     padding: const EdgeInsets.all(14.0).copyWith(bottom: 8, top: 8),
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                           border: Border.all(
  //                             color: const Color(0xff0168fa),
  //                           ),
  //                           borderRadius: BorderRadius.circular(4)),
  //                       padding: const EdgeInsets.all(6),
  //                       child: const Text(
  //                         'YAPIM AŞAMASINDA',
  //                         style: TextStyle(color: Color(0xff0168fa), fontSize: 10),
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0).copyWith(bottom: 0, right: 16),
  //                     child: const Text("19 Gün Kaldı",
  //                         style: TextStyle(
  //                           fontSize: 12,
  //                         )),
  //                   )
  //                 ],
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(14.0).copyWith(bottom: 4, top: 4),
  //                 child: const LinearProgressIndicator(
  //                   value: 0.5,
  //                   semanticsLabel: 'Linear progress indicator',
  //                 ),
  //               ),
  //               const SizedBox(height: 4),
  //               const Divider(),
  //               Padding(
  //                 padding: const EdgeInsets.all(14.0).copyWith(bottom: 4, top: 4),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   mainAxisSize: MainAxisSize.max,
  //                   children: const [
  //                     Text(
  //                       "Başlangıç \n11 Şubat 2022",
  //                       style: TextStyle(fontSize: 12),
  //                     ),
  //                     Text(
  //                       "Bitiş \n20 Haziran 2022",
  //                       style: TextStyle(fontSize: 12),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               const Divider(),
  //               SizedBox(
  //                 width: MediaQuery.of(context).size.width - 70,
  //                 child: Stack(
  //                   children: const [
  //                     SizedBox(width: 15),
  //                     Padding(
  //                       padding: EdgeInsets.all(2.0),
  //                       child: CircleAvatar(
  //                         maxRadius: 19,
  //                         backgroundColor: Colors.blue,
  //                         child: Text(
  //                           "SÜ",
  //                           style: TextStyle(color: Colors.white),
  //                         ),
  //                       ),
  //                     ),
  //                     Positioned(
  //                       left: 25,
  //                       child: Padding(
  //                         padding: EdgeInsets.all(2.0),
  //                         child: CircleAvatar(
  //                           maxRadius: 19,
  //                           backgroundColor: Colors.orange,
  //                           child: Text(
  //                             "YE",
  //                             style: TextStyle(color: Colors.white),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     Positioned(
  //                       left: 50,
  //                       child: Padding(
  //                         padding: EdgeInsets.all(2.0),
  //                         child: CircleAvatar(
  //                           maxRadius: 19,
  //                           backgroundColor: Colors.indigo,
  //                           child: Text(
  //                             "RU",
  //                             style: TextStyle(color: Colors.white),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               const SizedBox(height: 12),
  //             ],
  //           ),
  //         ),
  //       ),
  //       GestureDetector(
  //         onTap: () {
  //           Navigator.pushNamed(context, Routes.PROJECTS);
  //         },
  //         child: Card(
  //           elevation: 0,
  //           shape: RoundedRectangleBorder(
  //             side: BorderSide(color: Colors.grey[200]!, width: 1),
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: <Widget>[
  //               const SizedBox(height: 12),
  //               Padding(
  //                 padding: const EdgeInsets.all(14.0).copyWith(bottom: 4, top: 4),
  //                 child: Row(
  //                   children: [
  //                     Container(
  //                       decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(4)),
  //                       width: 40,
  //                       height: 40,
  //                       child: const Center(
  //                         child: Text(
  //                           "MA",
  //                           style: TextStyle(color: Colors.white),
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       width: 10,
  //                     ),
  //                     Wrap(
  //                       direction: Axis.vertical,
  //                       children: const [
  //                         Text(
  //                           "Bilişim Vadisi Saune ve Hamam Projesi",
  //                           style: TextStyle(fontSize: 15),
  //                         ),
  //                         Text(
  //                           "Cilek Havuz Sanayi",
  //                           style: TextStyle(fontSize: 12, color: Colors.grey),
  //                         ),
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(16.0).copyWith(bottom: 4, top: 8),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   mainAxisSize: MainAxisSize.max,
  //                   children: [
  //                     Wrap(
  //                       direction: Axis.vertical,
  //                       children: const [
  //                         Text(
  //                           "₺ 1.542.000",
  //                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //                         ),
  //                         Text(
  //                           "Bütçe",
  //                           style: TextStyle(fontSize: 12),
  //                         ),
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(14.0).copyWith(bottom: 4, top: 4),
  //                 child: const Text(
  //                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam consequat, eros sed venenatis sagittis, mi ligula ultrices justo.",
  //                   style: TextStyle(fontSize: 12, color: Colors.grey),
  //                 ),
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: <Widget>[
  //                   Padding(
  //                     padding: const EdgeInsets.all(14.0).copyWith(bottom: 8, top: 8),
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                           border: Border.all(
  //                             color: Colors.purple,
  //                           ),
  //                           borderRadius: BorderRadius.circular(4)),
  //                       padding: const EdgeInsets.all(6),
  //                       child: const Text(
  //                         'MÜSTERİ ONAYI BEKLENİYOR',
  //                         style: TextStyle(color: Colors.purple, fontSize: 10),
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0).copyWith(bottom: 0, right: 16),
  //                     child: const Text("19 Gün Kaldı",
  //                         style: TextStyle(
  //                           fontSize: 12,
  //                         )),
  //                   )
  //                 ],
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(14.0).copyWith(bottom: 4, top: 4),
  //                 child: LinearProgressIndicator(
  //                   value: 1,
  //                   semanticsLabel: 'Linear progress indicator',
  //                   color: Colors.purple,
  //                   backgroundColor: Colors.purple.withOpacity(0.3),
  //                 ),
  //               ),
  //               const SizedBox(height: 4),
  //               const Divider(),
  //               Padding(
  //                 padding: const EdgeInsets.all(14.0).copyWith(bottom: 4, top: 4),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   mainAxisSize: MainAxisSize.max,
  //                   children: const [
  //                     Text(
  //                       "Başlangıç \n11 Şubat 2022",
  //                       style: TextStyle(fontSize: 12),
  //                     ),
  //                     Text(
  //                       "Bitiş \n20 Haziran 2022",
  //                       style: TextStyle(fontSize: 12),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               const Divider(),
  //               SizedBox(
  //                 width: MediaQuery.of(context).size.width - 70,
  //                 child: Stack(
  //                   children: const [
  //                     SizedBox(width: 15),
  //                     Padding(
  //                       padding: EdgeInsets.all(2.0),
  //                       child: CircleAvatar(
  //                         maxRadius: 19,
  //                         backgroundColor: Colors.blue,
  //                         child: Text(
  //                           "SÜ",
  //                           style: TextStyle(color: Colors.white),
  //                         ),
  //                       ),
  //                     ),
  //                     Positioned(
  //                       left: 25,
  //                       child: Padding(
  //                         padding: EdgeInsets.all(2.0),
  //                         child: CircleAvatar(
  //                           maxRadius: 19,
  //                           backgroundColor: Colors.orange,
  //                           child: Text(
  //                             "YE",
  //                             style: TextStyle(color: Colors.white),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     Positioned(
  //                       left: 50,
  //                       child: Padding(
  //                         padding: EdgeInsets.all(2.0),
  //                         child: CircleAvatar(
  //                           maxRadius: 19,
  //                           backgroundColor: Colors.indigo,
  //                           child: Text(
  //                             "RU",
  //                             style: TextStyle(color: Colors.white),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               const SizedBox(height: 12),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(14),
        shrinkWrap: true,
        children: [
          Header(
            title: "Görevler",
            trailing: IconButton(
                onPressed: () {}, icon: const Icon(LineIcons.search)),
          ),
          FutureBuilder<List<ModuleTasks>>(
            future: data, // a previously-obtained Future<String> or null
            builder: (BuildContext context,
                AsyncSnapshot<List<ModuleTasks>> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = <Widget>[
                  for (var item in snapshot.data!) taskWidget(item)
                ];
              } else if (snapshot.hasError) {
                children = <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                ];
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 200,
                  child: const Center(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
