import 'package:cilekhavuz/pages/shared/boxtile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class TaskPersons extends StatefulWidget {
  const TaskPersons({Key? key}) : super(key: key);

  @override
  State<TaskPersons> createState() => _TaskPersonsState();
}

class _TaskPersonsState extends State<TaskPersons> {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(14), children: [
      BoxTile(
        margin: const EdgeInsets.only(bottom: 10),
        leading: const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            "MÖ",
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: const Text("Mehmet Özyılmaz"),
        subtitle: const Text("İnşaat Mühendisi"),
        trailing: Wrap(
          children: [
            IconButton(
                onPressed: () {
                  _launchUrl("mailto:yersoy@ritma.com.tr");
                },
                icon: const Icon(
                  LineIcons.envelope,
                  color: Colors.blue,
                )),
            IconButton(
                onPressed: () {
                  _launchUrl("tel:+905425123667");
                },
                icon: const Icon(
                  LineIcons.phone,
                  color: Colors.green,
                ))
          ],
        ),
      ),
      BoxTile(
        margin: const EdgeInsets.only(bottom: 10),
        leading: const CircleAvatar(
          backgroundColor: Colors.amber,
          child: Text(
            "CK",
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: const Text("Caver Kavaklı"),
        subtitle: const Text("Çevre Mühendisi"),
        trailing: Wrap(
          children: [
            IconButton(
                onPressed: () {
                  _launchUrl("mailto:yersoy@ritma.com.tr");
                },
                icon: const Icon(
                  LineIcons.envelope,
                  color: Colors.blue,
                )),
            IconButton(
                onPressed: () {
                  _launchUrl("tel:+905425123667");
                },
                icon: const Icon(
                  LineIcons.phone,
                  color: Colors.green,
                ))
          ],
        ),
      ),
      BoxTile(
        margin: const EdgeInsets.only(bottom: 10),
        leading: const CircleAvatar(
          backgroundColor: Colors.grey,
          child: Text(
            "Aİ",
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: const Text("Ali Yavuz İleri"),
        subtitle: const Text("Firma Denetçisi"),
        trailing: Wrap(
          children: [
            IconButton(
                onPressed: () {
                  _launchUrl("mailto:yersoy@ritma.com.tr");
                },
                icon: const Icon(
                  LineIcons.envelope,
                  color: Colors.blue,
                )),
            IconButton(
                onPressed: () {
                  _launchUrl("tel:+905425123667");
                },
                icon: const Icon(
                  LineIcons.phone,
                  color: Colors.green,
                ))
          ],
        ),
      ),
      BoxTile(
        margin: const EdgeInsets.only(bottom: 10),
        leading: const CircleAvatar(
          backgroundColor: Colors.purple,
          child: Text(
            "İK",
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: const Text("İbrahim Köse"),
        subtitle: const Text("Yönetici"),
        trailing: Wrap(
          children: [
            IconButton(
                onPressed: () {
                  _launchUrl("mailto:yersoy@ritma.com.tr");
                },
                icon: const Icon(
                  LineIcons.envelope,
                  color: Colors.blue,
                )),
            IconButton(
                onPressed: () {
                  _launchUrl("tel:+905425123667");
                },
                icon: const Icon(
                  LineIcons.phone,
                  color: Colors.green,
                ))
          ],
        ),
      ),
    ]);
  }
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch';
  }
}
