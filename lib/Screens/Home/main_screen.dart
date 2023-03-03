import 'package:appflut/Screens/Home/Pages/account_page.dart';
import 'package:appflut/Screens/Home/Pages/home_page.dart';
import 'package:appflut/Screens/Home/Pages/notif.page.dart';
import 'package:appflut/Screens/Home/Pages/schedule_page.dart';
import 'package:appflut/Screens/Home/Pages/search_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  final screens = [
    HomePage(),
    SchedulePage(),
    SearchPage(),
    NotifPage(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: currentPage,
          onTap: (index) {
            setState(() {
              currentPage = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: currentPage == 0
                    ? const Icon(
                        Icons.home,
                        color: Colors.black,
                      )
                    : Icon(Icons.home, color: Colors.grey.shade600),
                label: "Home"),
            BottomNavigationBarItem(
                icon: currentPage == 1
                    ? const Icon(
                        Icons.calendar_month,
                        color: Colors.black,
                      )
                    : Icon(Icons.calendar_month, color: Colors.grey.shade600),
                label: "Schedule"),
            BottomNavigationBarItem(
                icon: currentPage == 2
                    ? const Icon(
                        Icons.search,
                        color: Colors.black,
                      )
                    : Icon(Icons.search, color: Colors.grey.shade600),
                label: "Search"),
            BottomNavigationBarItem(
                icon: currentPage == 3
                    ? const Icon(
                        Icons.notification_important,
                        color: Colors.black,
                      )
                    : Icon(Icons.notification_important,
                        color: Colors.grey.shade600),
                label: "Notifications"),
            BottomNavigationBarItem(
                icon: currentPage == 4
                    ? const Icon(
                        Icons.person,
                        color: Colors.black,
                      )
                    : Icon(Icons.person, color: Colors.grey.shade600),
                label: "Account"),
          ]),
    );
  }
}
