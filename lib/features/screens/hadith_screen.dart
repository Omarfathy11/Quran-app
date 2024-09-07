import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/colors/colors.dart';
class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            Text(
              " الاحاديث الأربعين النووية",
              style: TextStyle(fontSize: 25.sp, color: text),
            ),
          ],
        ),
      ),
      body: Container(
        decoration:  BoxDecoration(
          color: background,
        ),
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/datas/list_ahdis.json'),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              var hadithdata = jsonDecode(snapshot.data.toString());
              return ListView.builder(
                itemCount: hadithdata.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white.withOpacity(0.05), // نصف شفاف
                     
                    
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Text(
                            '${hadithdata[index]['number']}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          '${hadithdata[index]['arab']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            height: 1.5, // تحسين المسافة بين السطور
                          ),
                        ),
                        SizedBox(height: 12.h),
                      ],
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ),
      ),
    );
  }
}