import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/colors/colors.dart';
import 'package:quran/screens/hadith_screen.dart';
import 'package:quran/screens/homepage.dart';
import 'package:quran/screens/sebha_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selctedindex = 0;
     List<Widget> widgetspages = const[
        HomeScreen(),
          HadithScreen(),
          SebhaScreen(),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             bottomNavigationBar: _bottomNavigationBar(),
             body: widgetspages.elementAt(selctedindex),

    );
  }
  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
    currentIndex: selctedindex,
          onTap: (index) {
           setState(() {
              selctedindex =index;
           });
          },
        type: BottomNavigationBarType
            .fixed, // بيخلي label تظهر // have fixed width
        showSelectedLabels: true, // مش بيظهر ال label ال محددها
        showUnselectedLabels: true, // don't show labels
        backgroundColor: gray,

        items: [
          _bottomBarItem(icon: "assets/svgs/quran-icon.svg", label: "quran",),
          _bottomBarItem(icon: "assets/svgs/doa-icon.svg", label: "Hadith",),
          _bottomBarItem(icon: "assets/svgs/pray-icon.svg", label: "prayer"),
          
        ],
      );

  BottomNavigationBarItem _bottomBarItem(
    
          {required String icon, required String label}) =>
      BottomNavigationBarItem(
        
        
          icon: SvgPicture.asset(
            icon,
            color: text,
          ),
          activeIcon: SvgPicture.asset(
            icon,
            color: primary,
          ),
          label: label);

}
 
