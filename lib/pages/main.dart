import 'package:badges/badges.dart';
import 'package:cilekhavuz/pages/dashboard/dashboard.dart';
import 'package:cilekhavuz/pages/reports/reports.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  //create a function that returns a widget with given index
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const Dashboard();
      case 1:
        return const Reports();
      default:
        return const Dashboard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedLabelStyle: const TextStyle(fontSize: 12, letterSpacing: 1),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Badge(
              badgeContent: Text(
                '3',
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(FontAwesomeIcons.personDigging, size: 30),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(LineIcons.barChart, size: 30),
            label: '',
          ),
        ],
        currentIndex: _currentIndex,
        unselectedItemColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (index) {
          //Handle button tap
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _getPage(_currentIndex),
    );
  }
}
