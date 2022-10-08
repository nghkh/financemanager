import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    required this.id,
    required this.email,
  });

  final String id;
  final String email;

  User.fromSnapshot(DocumentSnapshot snapshot, )
      : id = snapshot.id,
        email = snapshot['email'];
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
      };
  User.fromJson(Map<String, dynamic> json,)
      : id = json['id'],
        email = json['email'];
}
