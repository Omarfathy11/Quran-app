import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/colors/colors.dart';

import '../widgets/button_splach.dart';
import '../widgets/splach_image.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 16.h),
            Text(
              'Learn Quran and\nRecite once everyday',
              style: TextStyle(fontSize: 18.sp, color: text),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48.h),
            const SplachImage(),
            SizedBox(height: 20.h),
            ButtonSplach(), // Space before the button
          ],
        ),
      ),
    );
  }
}
