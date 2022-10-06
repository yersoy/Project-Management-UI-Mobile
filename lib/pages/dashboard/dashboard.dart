import 'package:cilekhavuz/api/api.dart';
import 'package:cilekhavuz/api/base.dart';
import 'package:cilekhavuz/models/ModuleTasks.dart';
import 'package:cilekhavuz/models/Person.dart';
import 'package:cilekhavuz/pages/project/task.dart';
import 'package:cilekhavuz/pages/shared/header.dart';
import 'package:cilekhavuz/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:html/parser.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  RefreshController refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    setState(() {
      data = API.workSteps();
    });
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  late Future<List<ModuleTasks>> data;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    data = API.workSteps();
  }

  Widget taskWidget(ModuleTasks item) {
    Color? statusColor = Utils.hexOrRGBToColor(item.eventStatusValue!.colorCode!);

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
          onTap: () async {
            await BASE.getUser().then((value) {
              Person? person = item.auditorPersonIds!.firstWhere(
                (x) => x.accountId == value!.data!.id,
                orElse: () {
                  return Person();
                },
              );
              Person? contact = item.auditorContactIds!.firstWhere(
                (x) => x.accountId == value!.data!.id,
                orElse: () {
                  return Person();
                },
              );
              if (person.name != null) {
                Future.delayed(const Duration(milliseconds: 300), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Task(
                              task: item,
                              isAuthorized: true,
                            )),
                  );
                });
              } else {
                Future.delayed(const Duration(milliseconds: 300), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Task(
                              task: item,
                              isAuthorized: false,
                            )),
                  );
                });
              }
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
                      percent: item.taskProgress != -1 ? (item.taskProgress! / 100) : 0,
                      progressColor: statusColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6).copyWith(left: 12, right: 12),
                      child: Text(
                        item.eventStatusName!,
                        style: TextStyle(color: statusColor, fontSize: 14, fontWeight: FontWeight.bold),
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
                Text(item.workStepName!, maxLines: 2, overflow: TextOverflow.ellipsis),
                item.startDate != null
                    ? const SizedBox(
                        height: 12,
                      )
                    : const SizedBox(),
                item.startDate != null ? Text(DateFormat('dd MMMM yyyy HH:mm', "tr").format(DateTime.parse(item.startDate!))) : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Görevlerim",
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1, fontSize: 24, color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                LineIcons.search,
                color: Colors.black,
              )),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SmartRefresher(
        enablePullDown: true,
        controller: refreshController,
        onRefresh: _onRefresh,
        child: ListView(
          padding: const EdgeInsets.all(14).copyWith(top: 0),
          shrinkWrap: true,
          children: [
            FutureBuilder<List<ModuleTasks>>(
              future: data, // a previously-obtained Future<String> or null
              builder: (BuildContext context, AsyncSnapshot<List<ModuleTasks>> snapshot) {
                List<Widget> children;
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  children = <Widget>[for (var item in snapshot.data!) taskWidget(item)];
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
