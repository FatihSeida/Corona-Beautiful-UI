import 'dart:convert';

class DataIndonesia {
  DataIndonesia({
    required this.name,
    required this.positif,
    required this.sembuh,
    required this.meninggal,
    required this.dirawat,
  });

  String name;
  String positif;
  String sembuh;
  String meninggal;
  String dirawat;

  factory DataIndonesia.fromJson(String str) =>
      DataIndonesia.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataIndonesia.fromMap(Map<String, dynamic> json) => DataIndonesia(
        name: json["name"],
        positif: json["positif"],
        sembuh: json["sembuh"],
        meninggal: json["meninggal"],
        dirawat: json["dirawat"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "positif": positif,
        "sembuh": sembuh,
        "meninggal": meninggal,
        "dirawat": dirawat,
      };
}
