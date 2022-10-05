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
