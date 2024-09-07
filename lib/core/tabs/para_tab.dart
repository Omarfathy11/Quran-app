import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/core/colors/colors.dart';
import 'package:quran/features/screens/detailsreader.dart';

import '../../features/Home/domain/entites/surah.dart';

class ParaTab extends StatelessWidget {
  const ParaTab({super.key});


  Future<List<Surah>> _getSearchList() async {
    String data = await rootBundle.loadString("assets/datas/list-surah.json");
    return surahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
        future: _getSearchList(),
        initialData:const [],
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.separated(
            itemBuilder: (context, index) => Divider(
              color: const Color(0xFF7B80AD).withOpacity(.35),
            ),
            separatorBuilder: (context, index) =>
                _surahItem(surah: snapshot.data!.elementAt(index), context: context),
            itemCount: snapshot.data!.length,
          );
        }));
  }

  Widget _surahItem({required BuildContext context,required Surah surah}) => GestureDetector(behavior: HitTestBehavior.opaque,

    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsScreen(noSurat: surah.nomor,)));
    },
    child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset("assets/svgs/nomor-surah.svg"),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Center(
                        child: Text(
                      "${surah.nomor}",
                      style: const TextStyle(color: Colors.white),
                    )),
                  )
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.namaLatin,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        'الشيخ مشاري العفاسي',
                        style: TextStyle(
                            fontSize: 15,
                            color: text,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: text,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    
                    ],
                  )
                ],
              )),
              Text(
                surah.nama,
                style: TextStyle(fontSize: 20, color: primary, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
  );
}