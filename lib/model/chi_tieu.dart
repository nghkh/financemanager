import 'package:cloud_firestore/cloud_firestore.dart';

class ChiTieu {
  ChiTieu({
    required this.chiphi,
    required this.id,
    required this.loai,
    required this.idthang,
    required this.iduser,
  });
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
        chiphi = snapshot['chiphi'];
  ChiTieu.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        iduser = json['iduser'],
        idthang = json['idthang'],
        loai = json['loai'],
        chiphi = json['chiphi'];
  Map<String, dynamic> toJson() => {
        'id': id,
        'iduser': iduser,
        'idthang': idthang,
        'loai': loai,
        'chiphi': chiphi,
      };
}
