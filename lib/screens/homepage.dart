import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/colors/colors.dart';

import 'package:quran/tabs/surah_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          automaticallyImplyLeading: false, // بتشيل زرار الباك
          elevation: 0,
          title: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/svgs/menu-icon.svg")),
               SizedBox(
                width: 24.w,
              ),
              Text(
                "القرآن الكريم",
                style: TextStyle(fontSize: 30.sp, color: Colors.blueGrey),
              ),
               SizedBox(
                width: 24.w,
              ),
            ],
          ),
        ),
        body: DefaultTabController(
          length: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverToBoxAdapter(
                        child: _greeting(),
                      ),
                    ],
                body: const TabBarView(
                  children: [
                    SurahTab(),
                  ],
                )),
          ),
        ));
  }

  Column _greeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        _lastRead(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Stack _lastRead() {
    return Stack(
      children: [
        Container(
          height: 131.h,
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
               SizedBox(
                height: 20.h,
              ),
               Text(
                "Al-Fatihah",
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
               SizedBox(
                height: 4.h,
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
}
