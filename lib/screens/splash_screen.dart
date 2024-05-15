import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/colors/colors.dart';
import 'package:quran/screens/layoutsccen.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer( const Duration(seconds: 5), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LayoutScreen(),
      ));
    });

    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: ListView(
          children: [
            Center(
              child: Text(
                'Quran App',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35.sp,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Learn Quran and\nRecite once everyday',
              style: TextStyle(fontSize: 18.sp, color: text),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 48.h,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 250.h,
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFF672CBC),
                  ),
                  child: SvgPicture.asset('assets/svgs/splash.svg'),
                ),
                Positioned(
                  left: 0,
                  bottom: -50,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LayoutScreen(),
                        ));
                      },
                     
                       
                      ),
                    ),
                  ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}