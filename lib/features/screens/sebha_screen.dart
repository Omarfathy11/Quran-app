import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/core/colors/colors.dart';
import 'package:quran/features/screens/zaker_screen.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  final List<String> _azkar = [
    "سبحان الله",
    "الحمدلله",
    "لا اله إلا الله",
    "الله أكبر",
    "لا حول ولا قوة إلا بالله"
  ];
  
  double _turns = 0.0;
  int _counter = 0;
  int _currentIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 34) {
        _counter = 0;
        _currentIndex = (_currentIndex + 1) % _azkar.length;
      }
    });
  }

  void _ressetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
           
            SizedBox(
              width: 10.w,
            ),
            Text(
              "السبحة الإلكترونية",
              style: TextStyle(fontSize: 22.sp, color: text),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              AnimatedRotation(
                turns: _turns,
                duration: const Duration(milliseconds: 350),
                child: Image.asset(
                  "assets/images/body_sebha_dark.png",
                  color: Colors.white,
                  width: 200.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                '$_counter',
                style: TextStyle(fontSize: 80.sp, color: Colors.white),
              ),
              Text(
                _azkar[_currentIndex],
                style: TextStyle(
                  fontSize: 30.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.sp),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton.extended(
                backgroundColor: Colors.deepPurpleAccent,
                onPressed: _ressetCounter,
                label: Text(
                  'تصفير',
                  style: TextStyle(fontSize: 20.sp),
                ),
                icon: const Icon(Icons.settings_backup_restore),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.1.sp, 0.7.sp),
            child: FloatingActionButton.extended(
              backgroundColor: Colors.deepPurpleAccent,
              onPressed: () {
                _incrementCounter();
                _turns += 0.03;
              },
              label: Text(
                'تسبيح',
                style: TextStyle(fontSize: 20.sp),
              ),
              icon: const Icon(Icons.fingerprint),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
              backgroundColor: Colors.deepPurpleAccent,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Zaker()));
              },
              label: Text(
                'دعاء',
                style: TextStyle(fontSize: 20.sp),
              ),
              icon: const Icon(Icons.book),
            ),
          ),
        ],
      ),
    );
  }
}