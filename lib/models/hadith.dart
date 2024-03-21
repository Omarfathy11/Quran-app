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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['arab'] = this.arab;
    data['id'] = this.id;
    return data;
  }
}