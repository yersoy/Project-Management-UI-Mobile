import 'package:cilekhavuz/pages/shared/boxtile.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class TaskImages extends StatefulWidget {
  const TaskImages({Key? key}) : super(key: key);

  @override
  State<TaskImages> createState() => _TaskImagesState();
}

class _TaskImagesState extends State<TaskImages> {
  String dropdownValue = "Kurumsal Denetim";
  List<String> list = <String>['Tümü', 'Beton Atma', 'Kurumsal Denetim', 'Zemin Etüdü'];
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(14).copyWith(top: 0), children: [
      BoxTile(
          margin: const EdgeInsets.symmetric(vertical: 14),
          title: const Text(
            "Filtre",
            style: TextStyle(fontSize: 18),
          ),
          trailing: DropdownButton<String>(
            value: dropdownValue,
            icon: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(LineIcons.angleDown, size: 18),
            ),
            underline: const SizedBox(),
            elevation: 0,
            style: const TextStyle(color: Colors.blue),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )),
      Card(
        margin: const EdgeInsets.only(bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            ListTile(
              title: const Text("Havuzun Önden Fotoğrafı"),
              subtitle: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration:
                        BoxDecoration(color: const Color(0xff4800ff).withOpacity(0.6), borderRadius: const BorderRadius.all(Radius.circular(20))),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Beton Atma - Mikserlerin Getirilmesi",
                  ),
                ],
              ),
              trailing: IconButton(onPressed: () {}, icon: const Icon(LineIcons.download)),
            ),
            Image.network(
              'https://www.cilekhavuz.com.tr/uploads/2021/01/havuz-villa-slider.jpg',
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
      Card(
        margin: const EdgeInsets.only(bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            ListTile(
              title: const Text("Havuzun Önden Fotoğrafı"),
              subtitle: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration:
                        BoxDecoration(color: const Color(0xff00b8d4).withOpacity(0.6), borderRadius: const BorderRadius.all(Radius.circular(20))),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Kurumsal Denetim - İlerleme",
                  ),
                ],
              ),
              trailing: IconButton(onPressed: () {}, icon: const Icon(LineIcons.download)),
            ),
            Image.network(
              'https://www.cilekhavuz.com.tr/uploads/2021/12/optimum-3.jpg',
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
      Card(
        margin: const EdgeInsets.only(bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            ListTile(
              title: const Text("Havuzun Yandan Fotoğrafı"),
              subtitle: const Text(
                "Proje Resmi",
                maxLines: 1,
              ),
              trailing: IconButton(onPressed: () {}, icon: const Icon(LineIcons.download)),
            ),
            Image.network(
              'https://www.cilekhavuz.com.tr/uploads/2021/07/%C3%A7ilek%C5%9File1-min.jpg',
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    ]);
  }
}
