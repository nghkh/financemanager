import 'package:cloud_firestore/cloud_firestore.dart';

class ChiTieuThang {
  ChiTieuThang(
    this.iduser,
    this.tongchiphi, {
    required this.id,
    required this.thang,
  });
  final String id;
  final String iduser;
  final String thang;
  final String tongchiphi;

  ChiTieuThang.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        iduser = snapshot['iduser'],
        thang = snapshot['thang'],
        tongchiphi = snapshot['tongchiphi'];
  factory ChiTieuThang.fromJson(Map<String, dynamic> json) {
    return ChiTieuThang(
      json['iduser'],
      json['tongchiphi'],
      id: json['id'],
      thang: json['thang'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'iduser': iduser,
      'thang': thang,
      'tongchiphi': tongchiphi,
    };
  }
}
