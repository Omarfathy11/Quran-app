import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran/colors/colors.dart';
import 'package:quran/models/ayat.dart';
import 'package:quran/models/surah.dart';

import 'package:http/http.dart' as http;

class DetailsScreen extends StatefulWidget {
  final int noSurat;

  const DetailsScreen({Key? key, required this.noSurat}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailsScreen> {
  double audioProgress = 0.0;

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Future<List<String>> fetchAudioUrls() async {
    try {
      final response =
          await http.get(Uri.parse('https://equran.id/api/surat/'));
      if (response.statusCode == 200) {
        final List<dynamic> surahs = json.decode(response.body);
        final List<String> audioUrls =
            surahs.map((surah) => surah['audio'].toString()).toList();
        return audioUrls;
      } else {
        throw Exception('Failed to fetch audio data from API');
      }
    } catch (e) {
      throw Exception('Failed to fetch audio data: $e');
    }
  }

  Future<Surah> _getDetailSurah() async {
    final data =
        await Dio().get("https://equran.id/api/surat/${widget.noSurat}");
    audioPlayer.onAudioPositionChanged.listen((Duration position) {
      setState(() {
        audioProgress = position.inMilliseconds.toDouble();
      });
    });
    return Surah.fromJson(json.decode(data.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Surah>(
      future: _getDetailSurah(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: background,
          );
        }
        final surah = snapshot.data!;
        return Scaffold(
          backgroundColor: background,
          appBar: _appBar(context: context, surah: surah),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: _details(surah: surah),
              )
            ],
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  Container(
                    child: IconButton(
                      onPressed: () async {
                        if (isPlaying) {
                          audioPlayer.pause();
                        } else {
                          final audioUrl = surah
                              .audio; // استخدم الرابط الصحيح للسورة المحددة
                          audioPlayer.play(audioUrl, isLocal: true);
                        }
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  LinearProgressIndicator(
                    value: audioProgress/surah.audio.length, // تحديث قيمة التقدم
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.white),
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _ayatItem({required Ayat ayat, required Surah surah}) => Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                  color: gray, borderRadius: BorderRadius.circular(10)),
              child: const Row(
                children: [
                   Spacer(),
                 
                ],
              ),
            ),
             SizedBox(
              height: 24.h,
            ),
             SizedBox(
              height: 16.h,
            ),
          ],
        ),
      );

  Widget _details({required Surah surah}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(children: [
          Container(
            height: 257,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0,
                      .6,
                      1
                    ],
                    colors: [
                      Color(0xFFDF98FA),
                      Color(0xFFB070FD),
                      Color(0xFF9055FF)
                    ])),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Opacity(
                  opacity: .2,
                  child: SvgPicture.asset(
                    'assets/svgs/quran.svg',
                    width: 324 - 55,
                  ))),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            child: Column(
              children: [
                Text(
                  surah.namaLatin,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 26.sp),
                ),
                 SizedBox(
                  height: 4.h,
                ),
                Divider(
                  color: Colors.white.withOpacity(.35),
                  thickness: 2,
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      surah.tempatTurun.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                     SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      width: 4.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.white),
                    ),
                     SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "${surah.jumlahAyat} Ayat",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                 SizedBox(
                  height: 32.h,
                ),
                SvgPicture.asset('assets/svgs/bismillah.svg')
              ],
            ),
          )
        ]),
      );

  AppBar _appBar({required BuildContext context, required Surah surah}) =>
      AppBar(
        backgroundColor: background,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(children: [
          IconButton(
              onPressed: (() => Navigator.of(context).pop()),
              icon: SvgPicture.asset('assets/svgs/back-icon.svg')),
           SizedBox(
            width: 24.w,
          ),
          Text(
            surah.nama,
            style:
                TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
              onPressed: (() => {}),
              icon: SvgPicture.asset('assets/svgs/search-icon.svg')),
        ]),
      );
}
