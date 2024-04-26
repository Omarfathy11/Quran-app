import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/colors/colors.dart';
import 'package:quran/screens/zaker_screen.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

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


  

  void _ressetCounter(){
    setState(() {
      _counter=0;
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
                icon: SvgPicture.asset("assets/svgs/menu-icon.svg")),
            const SizedBox(
              width: 24,
            ),
            Text(
              " السبحة الالكترونية",
              style: GoogleFonts.poppins(fontSize: 30),
            ),
            const SizedBox(
              width: 24,
            ),
          ],
        ),
      ),
      body: Column(
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
                     "assets/images/body_sebha_dark.png",color: Colors.white,
                    ))
              ),
        ]),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                Text(
                  ' $_counter',
                  style: const TextStyle(fontSize: 80, color: Colors.white),
                ),
                Text(
                  _azkar[_currentIndex],
                  style:const TextStyle(fontSize: 50, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        children:  <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 31),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton.extended(backgroundColor: Colors.deepPurpleAccent,onPressed:() {
                _ressetCounter();
              }, label: const Text('تصفير',style: TextStyle(fontSize: 20),),
              icon: const Icon(Icons.settings_backup_restore,),),
            ),
          ),
          Align(
            alignment: const Alignment(0.1,0.7),
            child:FloatingActionButton.extended(backgroundColor: Colors.deepPurpleAccent,onPressed:() {
                _incrementCounter();
                 _turns += 0.03;
              }, label: const Text('تسبيح',style: TextStyle(fontSize: 20),),
              icon: const Icon(Icons.fingerprint,),), 
          ),
          Align(
            alignment:Alignment.bottomRight,
            child: FloatingActionButton.extended(backgroundColor: Colors.deepPurpleAccent,onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Zaker()));
              }, label: const Text('دعاء',style: TextStyle(fontSize: 20),),
              icon: const Icon(Icons.book,),),

          )
        ],
      ),
    );
  }
}
