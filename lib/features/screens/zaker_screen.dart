import 'package:flutter/material.dart';
import 'package:quran/core/colors/colors.dart';

class Zaker extends StatelessWidget {
  const Zaker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: const Text(
          'دعاء',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration:  BoxDecoration(
         color: background
        ),
        child: Center(
          child: Container(
            height: 250,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: background, // شفافية للخلفية
              borderRadius: BorderRadius.circular(20), // زوايا ناعمة
            
              
            ),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.right,
                'لا إله إلّا أنتَ سبحانك إنّي كنت من الظالمين .. اللّهم إنّي أسالك بأن لك الحمد لا إله إلّا أنتَ وحدك لا شريك لك، المنان يا بديع السموات والأرض ياذا الجلال والإكرام، يا حي يا قيوم إنّي أسألك الجنة وأعوذ بك من النار. اللّهم إنك عفو كريم تحب العفو فاعفُ عني. اللّهم أرزقني حُبك وحُب من ينفعني حُبّهُ عندك.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  height: 1.6, // مسافة بين السطور
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
