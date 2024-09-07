import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/core/colors/colors.dart';
import 'package:quran/features/screens/hadith_screen.dart';
import 'package:quran/features/Home/presntaion/screens/homepage.dart';
import 'package:quran/features/screens/homereader.dart';
import 'package:quran/features/screens/sebha_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;

  List<Widget> widgetPages = const [
    HomeScreen(),
    NewPage(),
    HadithScreen(),
    SebhaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: widgetPages.elementAt(selectedIndex),
    );
  }

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: gray,
        selectedItemColor: Colors.white, // لون عند التحديد
        unselectedItemColor: Colors.white.withOpacity(0.6), // لون عند عدم التحديد
        selectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: [
          _bottomBarItem(
            icon: "assets/svgs/quran-icon.svg",
            label: "Quran",
          ),
          _bottomBarItem(
            icon: "assets/svgs/nomor-surah.svg",
            label: "Reader",
          ),
          _bottomBarItem(
            icon: "assets/svgs/doa-icon.svg",
            label: "Hadith",
          ),
          _bottomBarItem(
            icon: "assets/svgs/pray-icon.svg",
            label: "Prayer",
          ),
        ],
      );

  BottomNavigationBarItem _bottomBarItem({required String icon, required String label}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        height: 30, // حجم الأيقونة
      ),
      activeIcon: Column(
        children: [
          SvgPicture.asset(
            icon,
            height: 30, // نفس الحجم
          ),
          const SizedBox(height: 4), // مسافة بين الأيقونة والنص
          
        ],
      ),
      label: label,
    );
  }
}