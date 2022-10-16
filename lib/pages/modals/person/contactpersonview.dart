import 'package:cilekhavuz/api/api.dart';
import 'package:cilekhavuz/api/base.dart';
import 'package:cilekhavuz/models/AuthModel.dart';
import 'package:cilekhavuz/models/ContactPersonModel.dart';
import 'package:cilekhavuz/models/ModuleTasks.dart';
import 'package:cilekhavuz/models/Person.dart';
import 'package:cilekhavuz/models/WorkStepResult.dart';
import 'package:cilekhavuz/pages/shared/boxtile.dart';
import 'package:cilekhavuz/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ContactPerson extends StatefulWidget {
  final ModuleTasks task;
  const ContactPerson({Key? key, required this.task}) : super(key: key);

  @override
  State<ContactPerson> createState() => _ContactPersonState();
}

class _ContactPersonState extends State<ContactPerson> {
  List<int> personIds = [];
  List<int> tasksPersonsIds = [];
  Future<List<ContactPersonModel>>? listFuture;
  ContactPersonModel? selectedPersonel;
  removeUserFromTask(context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    AuthModel? user = await BASE.getUser();
    int userid = user!.data!.id!;
    personIds.clear();
    setState(() {
      widget.task.personIds!
          .removeWhere((x) => x.id == selectedPersonel!.id || x.id == null);
    });

    for (var item in widget.task.personIds!) {
      personIds.add(item.id!);
    }
    personIds = personIds.toSet().toList();
    WorkStepResult data =
        await API.workStepRedirect(widget.task, personIds.toString());
    if (data.data!) {
      Navigator.pop(context);
      Utils.showDefaultSnackbar(
          context,
          "Görev ${selectedPersonel!.name!} isimli kişi görevden alındı ",
          const Icon(LineIcons.times, color: Colors.red));
    } else {
      Navigator.pop(context);
      Utils.showDefaultSnackbar(
          context,
          data.message!,
          const Icon(
            LineIcons.times,
            color: Colors.red,
          ));
    }
  }

  redirectTask(context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    AuthModel? user = await BASE.getUser();
    int userid = user!.data!.id!;
    personIds.clear();
    setState(() {
      widget.task.personIds!.removeWhere((x) => x.id == userid || x.id == null);
      widget.task.personIds!.add(Person()..id = selectedPersonel!.id);
    });
    for (var item in widget.task.personIds!) {
      personIds.add(item.id!);
    }
    personIds = personIds.toSet().toList();
    WorkStepResult data =
        await API.workStepRedirect(widget.task, personIds.toString());
    if (data.data!) {
      Navigator.pop(context);
      Utils.showDefaultSnackbar(
          context,
          "Görev ${selectedPersonel!.name!} isimli kişiye yönlendirildi ",
          const Icon(LineIcons.share, color: Colors.green));
    } else {
      Navigator.pop(context);
      Utils.showDefaultSnackbar(
          context,
          data.message!,
          const Icon(
            LineIcons.times,
            color: Colors.red,
          ));
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listFuture= API.getPersonnelByContactId();
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
        title: const Text(
          "Görevi Yönlendir",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder<List<ContactPersonModel>>(
        future: listFuture,
        builder: (BuildContext context,
            AsyncSnapshot<List<ContactPersonModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(14),
              children: [
                for (var item in snapshot.data!)
                  BoxTile(
                      onTap: widget.task.personIds!
                              .where((x) => x.id == item.id)
                              .isEmpty
                          ? () {
                              selectedPersonel = item;
                              redirectTask(context);
                            }
                          : () {
                              selectedPersonel = item;
                              removeUserFromTask(context);
                            },
                      margin: const EdgeInsets.only(bottom: 8),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        backgroundImage: item.imagePath != null
                            ? NetworkImage(item.imagePath!)
                            : null,
                        child: item.imagePath == null
                            ? Text(
                                item.name![0],
                                style: const TextStyle(color: Colors.white),
                              )
                            : null,
                      ),
                      title: Text(item.name!),
                      subtitle: Text(item.title!),
                      trailing: widget.task.personIds!
                              .where((x) => x.id == item.id)
                              .isEmpty
                          ? const Icon(LineIcons.angleRight)
                          : const Icon(
                              LineIcons.check,
                              color: Colors.green,
                            ))
              ],
            );
          } else if (snapshot.hasError) {
            return const BoxTile(title: Text("Bir Hata Oluştu"));
          }
          return Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: const Center(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
