import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran/core/colors/colors.dart';
import 'package:quran/models/ayat.dart';
import '../Home/domain/entites/surah.dart';

class DetailsScreen extends StatefulWidget {
  final int noSurat;

  const DetailsScreen({Key? key, required this.noSurat}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailsScreen> {
  double audioProgress = 0.0; // موضع الصوت الحالي
  String currentTime = "00:00";
  String totalTime = "00:00";

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration totalDuration = Duration.zero;

  Future<Surah> _getDetailSurah() async {
    final data =
        await Dio().get("https://equran.id/api/surat/${widget.noSurat}");

    audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        audioProgress = position.inMilliseconds.toDouble();
        currentTime = _formatDuration(position);
      });
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        totalDuration = duration;
        totalTime = _formatDuration(duration);
      });
    });

    return Surah.fromJson(json.decode(data.toString()));
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void _seekAudio(Duration duration) {
    audioPlayer.seek(duration);
  }

  void _onSliderChanged(double value) {
    _seekAudio(Duration(milliseconds: value.toInt()));
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
                  SizedBox(height: 20.h),

                  IconButton(
                    onPressed: () async {
                      if (isPlaying) {
                        audioPlayer.pause();
                      } else {
                        final audioUrl = surah.audio;
                        audioPlayer.play(UrlSource(audioUrl));
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
                  SizedBox(height: 20.h),
                  // شريط التقدم
                  Column(
                    children: [
                      Slider(
                        value: audioProgress.clamp(
                            0.0, totalDuration.inMilliseconds.toDouble()),
                        min: 0.0,
                        max: totalDuration.inMilliseconds.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            audioProgress = value;
                          });
                          _onSliderChanged(value);
                        },
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey,
                      ),
                      // عرض الوقت
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(currentTime,
                              style: const TextStyle(color: Colors.white)),
                          Text(totalTime,
                              style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  // زر التشغيل

                  // أزرار التحكم في الوقت
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.replay_10, color: Colors.white),
                        onPressed: () {
                          _seekAudio(Duration(
                              milliseconds: audioProgress.toInt() - 10000));
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.forward_10, color: Colors.white),
                        onPressed: () {
                          _seekAudio(Duration(
                              milliseconds: audioProgress.toInt() + 10000));
                        },
                      ),
                    ],
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
            SizedBox(height: 24.h),
            SizedBox(height: 16.h),
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
                SizedBox(height: 4.h),
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
                    SizedBox(width: 5.w),
                    Container(
                      width: 4.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.white),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "${surah.jumlahAyat} Ayat",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
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
          SizedBox(width: 24.w),
          Text(
            surah.nama,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          const Spacer(),
        ]),
      );
}
