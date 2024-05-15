import 'package:flutter/material.dart';

import 'package:quran/colors/colors.dart';

class Zaker extends StatelessWidget {
  const Zaker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          
        ),
        body: Center(
          child: Container(
            
              height: 250,
              width: double.infinity,
              padding:const EdgeInsets.all(15.0),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
              child:const Align(
                heightFactor: 0.1,
                child: Text(
                  textAlign: TextAlign.right,
                  'لا إله إلّا أنتَ سبحانك إنّي كنت من الظالمين .. اللّهم إنّي أسالك بأن لك الحمد لا إله إلّا أنتَ وحدك لا شريك لك، المنان يا بديع السموات والأرض ياذا الجلال والإكرام، يا حي يا قيوم إنّي أسألك الجنة وأعوذ بك من النار. اللّهم إنك عفو كريم تحب العفو فاعفُ عني. اللّهم أرزقني حُبك وحُب من ينفعني حُبّهُ عندك.',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )),
        ));
  }
}
