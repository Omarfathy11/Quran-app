import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplachImage extends StatelessWidget {
  const SplachImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 250.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFF672CBC),
                  ),
                  child: SvgPicture.asset('assets/svgs/splash.svg'),
                ),
              ],
            );
  }
}