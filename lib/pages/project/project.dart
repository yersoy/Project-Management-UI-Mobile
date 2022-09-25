import 'package:cilekhavuz/pages/project/files.dart';
import 'package:cilekhavuz/pages/project/history.dart';
import 'package:cilekhavuz/pages/project/images.dart';
import 'package:cilekhavuz/pages/project/interviews.dart';
import 'package:cilekhavuz/pages/project/persons.dart';
import 'package:cilekhavuz/pages/project/summary.dart';
import 'package:cilekhavuz/pages/project/tasks.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> with TickerProviderStateMixin {
  TabController? tabcontroller;
  bool task3 = true;
  @override
  void initState() {
    super.initState();
    tabcontroller = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                leading: IconButton(
                  icon: const Icon(LineIcons.angleLeft, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                snap: true,
                toolbarHeight: 80,
                collapsedHeight: 125,
                floating: true,
                iconTheme: const IconThemeData(color: Colors.black),
                titleSpacing: 0,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
                      width: 40,
                      height: 40,
                      child: const Center(
                        child: Text(
                          "ŞT",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "İstanbul Park Evleri Sitesi Havuz Projesi",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            "Ritma Teknoloji Sanayi ve Ticaret Limited Şirketi",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                flexibleSpace: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TabBar(
                          labelColor: Colors.black,
                          indicatorColor: Colors.blue,
                          isScrollable: true,
                          controller: tabcontroller,
                          tabs: const [
                            Tab(
                              text: "Özet",
                            ),
                            Tab(
                              text: "Görevler",
                            ),
                            Tab(
                              text: "İlgililer",
                            ),
                            Tab(
                              text: "Fotoğraflar",
                            ),
                            Tab(
                              text: "Dosyalar",
                            ),
                            Tab(
                              text: "Görüşmeler",
                            ),
                            Tab(
                              text: "Geçmiş",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //3
            ),
          ];
        },
        body: TabBarView(
          controller: tabcontroller,
          children: const [Summary(), Tasks(), TaskPersons(), TaskImages(), TaskFiles(), ProjectInterviews(), ProjectHistory()],
        ),
      ),
    );
  }
}
