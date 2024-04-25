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
            
              height: 200,
              width: double.infinity,
              padding:const EdgeInsets.all(15.0),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
              child:const Align(
                heightFactor: 0.1,
                child: Text(
                  textAlign: TextAlign.right,
                  '    سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله سبحان الله',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )),
        ));
  }
}
