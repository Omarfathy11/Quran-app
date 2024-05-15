import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran/colors/colors.dart';
import 'package:quran/models/surah.dart';
import 'package:quran/screens/details.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<Surah>> _getSearchList() async {
    String data = await rootBundle.loadString("assets/datas/list-surah.json");
    return surahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
        future: _getSearchList(),
        initialData: const [],
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
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(noSurat: surah.nomor,)));
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
                        surah.tempatTurun.name,
                        style: TextStyle(
                            fontSize: 12,
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
                      Text(
                        "${surah.jumlahAyat} Ayat",
                        style: TextStyle(
                            fontSize: 12,
                            color: text,
                            fontWeight: FontWeight.w500),
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
