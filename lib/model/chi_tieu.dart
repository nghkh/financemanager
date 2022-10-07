import 'package:cloud_firestore/cloud_firestore.dart';

class ChiTieu {
  ChiTieu({
    required this.ngaythang,
    required this.chiphi,
    required this.id,
    required this.loai,
    required this.idthang,
    required this.iduser,
  });
  final String ngaythang;
  final String id;
  final String iduser;
  final String idthang;
  final String loai;
  final String chiphi;
  ChiTieu.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        iduser = snapshot['iduser'],
        idthang = snapshot['idthang'],
        loai = snapshot['loai'],
        chiphi = snapshot['chiphi'],
        ngaythang = snapshot['ngaythang'];

  ChiTieu.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        iduser = json['iduser'],
        idthang = json['idthang'],
        loai = json['loai'],
        chiphi = json['chiphi'],
        ngaythang = json['ngaythang'];
  Map<String, dynamic> toJson() => {
        'id': id,
        'iduser': iduser,
        'idthang': idthang,
        'loai': loai,
        'chiphi': chiphi,
      };
  String timetoMonth() {
    var now = DateTime.now();
    var month = now.month;
    var year = now.year;
    var monthYear = '$month/$year';
    return monthYear;
  }

  String timetoDay() {
    var now = DateTime.now();
    var day = now.day;
    var month = now.month;
    var year = now.year;
    var dayMonthYear = '$day/$month/$year';
    return dayMonthYear;
  }
}
