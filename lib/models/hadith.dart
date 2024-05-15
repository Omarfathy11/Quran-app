class Hadith {
  int? number;
  String? arab;
  String? id;

  Hadith({this.number, this.arab, this.id});

  Hadith.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    arab = json['arab'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['arab'] = arab;
    data['id'] = id;
    return data;
  }
}