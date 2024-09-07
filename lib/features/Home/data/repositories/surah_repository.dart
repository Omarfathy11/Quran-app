import 'dart:convert';
import 'package:flutter/services.dart';

import '../../domain/entites/surah.dart';

class SurahRepository {
  // دالة لتحميل السور من ملف JSON
  Future<List<Surah>> getSurahs() async {
    // تحميل بيانات JSON من الملف
    String data = await rootBundle.loadString("assets/datas/list-surah.json");

    // تحويل البيانات إلى قائمة من كائنات Surah
    List<dynamic> jsonData = json.decode(data);
    return jsonData.map((json) => Surah.fromJson(json)).toList();
  }
}