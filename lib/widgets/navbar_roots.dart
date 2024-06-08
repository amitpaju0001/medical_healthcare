import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_healthcare/screens/home_screen.dart';
import 'package:medical_healthcare/screens/message_screen.dart';
import 'package:medical_healthcare/screens/schedule_screen.dart';
import 'package:medical_healthcare/screens/setting_screen.dart';
import 'package:medical_healthcare/shared/const/color_const.dart';
import 'package:medical_healthcare/shared/const/string_const.dart';


class NavBarRoots extends StatefulWidget {
  const NavBarRoots({super.key});

  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    const HomeScreen(),
    const MessageScreen(),
    const ScheduleScreen(),
    const SettingScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.reUsedWhiteColor,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: ColorConst.reUsedWhiteColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorConst.reUsedBackgroundColor,
          unselectedItemColor: Colors.black26,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: StringConst.navigateHome),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_text_fill), label: StringConst.messageText),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: StringConst.scheduleHeader),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: StringConst.settingHeader),
          ],
        ),
      ),
    );
  }
}
