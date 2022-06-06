import 'dart:convert';

List<MahasiswaModel> mahasiswaModelFromJson(String str) =>
    List<MahasiswaModel>.from(json.decode(str).map((x) => MahasiswaModel.fromJson(x)));

String mahasiswaModelToJson(List<MahasiswaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MahasiswaModel {
  MahasiswaModel({
    required this.nim,
    required this.nama,
    required this.jenisKelamin,
    required this.jp,
});

  String nim;
  String nama;
  String jenisKelamin;
  String jp;

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) => MahasiswaModel(
    nim: json["NIM"],
    nama: json["Nama"],
    jenisKelamin: json["JenisKelamin"],
    jp: json["JP"],
  ); // Mahasiswa Model

  Map<String, dynamic> toJson() => {
    "NIM": nim,
    "Nama": nama,
    "JenisKelamin": jenisKelamin,
    "JP": jp,
  };
}