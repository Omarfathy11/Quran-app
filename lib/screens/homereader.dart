import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/colors/colors.dart';
import 'package:quran/tabs/para_tab.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
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
              const SizedBox(
                width: 24,
              ),
              Text(
                "القرآن الكريم",
                style: TextStyle(fontSize: 30.sp, color: Colors.blueGrey),
              ),
              const SizedBox(
                width: 24,
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
                      const SliverToBoxAdapter(),
                    ],
                body: const TabBarView(
                  children: [
                    ParaTab(),
                  ],
                )),
          ),
        ));
  }
}
