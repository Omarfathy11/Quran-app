import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/colors/colors.dart';
import 'package:quran/screens/zaker_screen.dart';

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
  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 34) {
        _counter = 0;
        _currentIndex = (_currentIndex + 1) % _azkar.length;
      }
    });
  }

  double _turns = 0.0;

  int _counter = 0;
  int _currentIndex = 0;

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
            automaticallyImplyLeading: false, // بتشيل زرار الباك
            elevation: 0,
            title: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/svgs/menu-icon.svg",
                    )),
                 SizedBox(
                  width: 24.w,
                ),
                Text(
                  " السبحة الالكترونية",
                  style: TextStyle(fontSize: 20.sp,color: Colors.blueGrey),
                ),
                const SizedBox(
                  width: 24,
                ),
              ],
            ),
          ),
          body: ListView(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  AnimatedRotation(
                    turns: _turns,
                    duration: const Duration(
                      milliseconds: 350,
                    ),
                    child: SizedBox(
                      child: Image.asset(
                        "assets/images/body_sebha_dark.png",
                        color: Colors.white,
                        width: 150,
                      ),
                    ),
                  ),
                ],
              ),
              
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        ' $_counter',
                        style: TextStyle(fontSize: 80.sp, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: 20.sp),
                      child: Text(
                        _azkar[_currentIndex],
                        style: TextStyle(fontSize: 30.sp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              
            ],
          ),
          floatingActionButton: Stack(
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.only(left:20.sp ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.deepPurpleAccent,
                    onPressed: () {
                      _ressetCounter();
                    },
                    label:  Text(
                      'تصفير',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    icon: const Icon(Icons.settings_backup_restore),
                  ),
                ),
              ),
              Align(
                alignment:  Alignment(0.2.sp, 0.7.sp),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Zaker()));
                  },
                  label: Text(
                    'دعاء',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  icon: const Icon(Icons.book),
                ),
              )
            ],
          ),
    );
  }
}
