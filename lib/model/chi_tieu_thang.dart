import 'package:cloud_firestore/cloud_firestore.dart';

class ChiTieuThang {
  ChiTieuThang({
    required this.tongchiphi,
    required this.thang,
    required this.id,
    required this.iduser,
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

  factory ChiTieuThang.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return ChiTieuThang(
        tongchiphi: doc['tongchiphi'],
        thang: doc['thang'],
        id: doc.id,
        iduser: doc['iduser']);
  }
}
