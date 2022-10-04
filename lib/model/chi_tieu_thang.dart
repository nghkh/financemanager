import 'package:cloud_firestore/cloud_firestore.dart';

class ChiTieuThang {
  ChiTieuThang({
    required this.id,
    required this.iduser,
    required this.thang,
    required this.tongchiphi,
  });
  final String id;
  final String iduser;
  final String thang;
  final String tongchiphi;

  factory ChiTieuThang.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return ChiTieuThang(
      id: snapshot.id,
      iduser: snapshot.data()!['iduser'],
      thang: snapshot.data()!['thang'],
      tongchiphi: snapshot.data()!['tongchiphi'],
    );
  }
  factory ChiTieuThang.fromJson(Map<String, dynamic> json) {
    return ChiTieuThang(
      id: json['id'],
      iduser: json['iduser'],
      thang: json['thang'],
      tongchiphi: json['tongchiphi'],
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
