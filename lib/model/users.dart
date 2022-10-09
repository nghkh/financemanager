import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.sdu,
  });
  final String sdu;
  final String id;
  final String email;

  UserModel.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        email = snapshot['email'],
        sdu = snapshot['sdu'];
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'sdu': sdu,
      };
  UserModel.fromJson(
    Map<String, dynamic> json,
  )   : id = json['id'],
        email = json['email'],
        sdu = json['sdu'];
}
