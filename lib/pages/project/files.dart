import 'package:cilekhavuz/pages/shared/boxtile.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class TaskFiles extends StatefulWidget {
  const TaskFiles({Key? key}) : super(key: key);

  @override
  State<TaskFiles> createState() => _TaskFilesState();
}

class _TaskFilesState extends State<TaskFiles> {
  String dropdownValue = "Kurumsal Denetim";
  List<String> list = <String>['Tümü', 'Beton Atma', 'Kurumsal Denetim', 'Zemin Etüdü'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          BoxTile(
              margin: const EdgeInsets.only(bottom: 14),
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
                    child: Text(
                      value,
                      textAlign: TextAlign.right,
                    ),
                  );
                }).toList(),
              )),
          Expanded(
            child: GridView.count(
                padding: EdgeInsets.zero,
                primary: false,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          LineIcons.pdfFile,
                          size: 60,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 25),
                        const Text("Tahsilat Makbuzu Çıktısı", style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  color: const Color(0xff4800ff).withOpacity(0.6), borderRadius: const BorderRadius.all(Radius.circular(20))),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              "Kurumsal Denetim",
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Icon(
                          LineIcons.image,
                          size: 60,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 25),
                        Text(
                          "Havuzun Resmi Sözleşmesi",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "CILEK-HAVUZ-SOZLESME.PDF",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Icon(
                          LineIcons.wordFile,
                          size: 60,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 25),
                        Text(
                          "Vergi Levhası",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "vergi-levhası.PDF",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Icon(
                          LineIcons.excelFile,
                          size: 60,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 25),
                        Text(
                          "Tüm Kalemler",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "ürünler.xls",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
