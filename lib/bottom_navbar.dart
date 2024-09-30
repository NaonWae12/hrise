import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dashboard/page_dashboard.dart';
import 'history/page_attendance_history.dart';
import 'home/page_home.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  var currentIndex = 0;

  final List<Widget> pages = [
    const PageHome(),
    const PageDashboard(),
    const PageAttendanceHistory(),
  ];

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
            left: displayWidth * .04,
            right: displayWidth * .04,
            bottom: displayWidth * .04), // Mengurangi margin
        height: displayWidth * .15, // Mengurangi tinggi navbar
        decoration: BoxDecoration(
          color: const Color(0xFFCA282C),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 20, // Mengurangi blur shadow
              offset: const Offset(0, 8), // Mengurangi offset shadow
            ),
          ],
          borderRadius: BorderRadius.circular(40), // Mengurangi radius sudut
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(listOfIcons.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  HapticFeedback.lightImpact();
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? displayWidth * .28 //ukuran aktif
                        : displayWidth * .16, //ukuran non-aktif
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex
                          ? 40 // tinggi item aktif
                          : 0,
                      width: index == currentIndex ? displayWidth * .28 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? const Color(0xFFAE181C)
                            : Colors.transparent,
                        borderRadius:
                            BorderRadius.circular(40), //  radius item aktif
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? displayWidth * .28
                        : displayWidth * .16,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth * .10
                                  : 0,
                            ),
                            AnimatedOpacity(
                              opacity: index == currentIndex ? 1 : 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == currentIndex
                                    ? listOfStrings[index]
                                    : '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,

                                  ///
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth * .02
                                  : 15,
                            ),
                            Icon(
                              listOfIcons[index],
                              size: displayWidth * .06, // ukuran ikon
                              color: index == currentIndex
                                  ? const Color(0xFFE89C1E)
                                  : Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.dashboard_customize_rounded,
    Icons.calendar_month_rounded,
  ];

  List<String> listOfStrings = [
    'Home',
    'Dashboard',
    'History',
  ];
}

// dummy halaman untuk setiap tab
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Ini adalah halaman Home')),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: const Center(child: Text('Ini adalah halaman Dashboard')),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: const Center(child: Text('Ini adalah halaman History')),
    );
  }
}
