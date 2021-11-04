/// date : "2021-11-03"
/// inr : 86.498926

class CurrencyINR {
  CurrencyINR({
      this.date, 
      this.inr,});

  CurrencyINR.fromJson(dynamic json) {
    date = json['date'];
    inr = json['inr'];
  }
  String? date;
  double? inr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['inr'] = inr;
    return map;
  }

}