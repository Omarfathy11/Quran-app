import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/colors/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/tabs/hijp_tab.dart';
import 'package:quran/tabs/page_tab.dart';
import 'package:quran/tabs/para_tab.dart';
import 'package:quran/tabs/surah_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: _appBar(),
        bottomNavigationBar: _bottomNavigationBar(),
        body: DefaultTabController(
          length: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverToBoxAdapter(
                        child: _greeting(),
                      ),
                      SliverAppBar(
                        backgroundColor: background,
                        automaticallyImplyLeading: false,
                        pinned: true,
                        bottom: PreferredSize(
                            child: _tab(), preferredSize: Size.fromHeight(0)),
                      )
                    ],
                body: const TabBarView(children: [SurahTab(),HijpTab(),PageTab(),ParaTab(),],)),
          ),
        ));
  }

  TabBar _tab() {
    return TabBar(unselectedLabelColor: text, labelColor: Colors.white,indicatorColor: primary, tabs: const[
       Tab(
        child: Text(
          "surah",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      Tab(
        child: Text(
          "para",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      Tab(
        child: Text(
          "page",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      Tab(
        child: Text(
          "Hijb",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }

  Column _greeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Assalamualaikum",
          style:
              TextStyle(color: text, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Omar Fathy",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        _LastRead(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Stack _LastRead() {
    return Stack(
      children: [
        Container(
          height: 131,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft, // بتتحكم في مواقع الالوان
                end: Alignment.bottomRight, // بتتحكم في مواقع الالوان
                colors: [
                  Color(0xFFDF68FA),
                  Color(0xFFB070FD),
                  Color(0xFF9055FF)
                ]),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/svgs/quran.svg",
            )),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/svgs/book.svg"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Last Read",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Al-Fatihah",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "Ayat no : 1",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }

  AppBar _appBar() => AppBar(
        backgroundColor: background,
        automaticallyImplyLeading: false, // بتشيل زرار الباك
        title: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/svgs/menu-icon.svg")),
            const SizedBox(
              width: 24,
            ),
            Text(
              "القرآن الكريم",
              style: GoogleFonts.poppins(fontSize: 30),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/svgs/search-icon.svg")),
            const SizedBox(
              width: 24,
            ),
          ],
        ),
      );
  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // بيخلي label تظهر // have fixed width
        showSelectedLabels: true, // مش بيظهر ال label ال محددها
        showUnselectedLabels: false, // don't show labels
        backgroundColor: gray,

        items: [
          _bottomBarItem(icon: "assets/svgs/quran-icon.svg", label: "quran"),
          _bottomBarItem(icon: "assets/svgs/lamp-icon.svg", label: "tips"),
          _bottomBarItem(icon: "assets/svgs/pray-icon.svg", label: "prayer"),
          _bottomBarItem(icon: "assets/svgs/doa-icon.svg", label: "doa"),
          _bottomBarItem(
              icon: "assets/svgs/bookmark-icon.svg", label: "bookmark"),
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
