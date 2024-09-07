import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:quran/core/colors/colors.dart';

class PageTab extends StatelessWidget {
  const PageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
           backgroundColor: background,

        body: FutureBuilder(
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
                                    child: Text('${hadithdata[index]['number']}',style: const TextStyle(color: Colors.black, fontSize: 15),),
                                    
                                  ),
                                  Text('${hadithdata[index]['arab']}',style: const TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.normal),),
                                   const SizedBox(height: 12,),
                              ],
                              
                            ),
                      );
                    });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            })),
      ),
    );
  }
}
