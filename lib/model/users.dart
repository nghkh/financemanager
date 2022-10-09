import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.email,
  });

  final String id;
  final String email;
  final String firstName;
  final String lastName;

  User.fromSnapshot(
    DocumentSnapshot snapshot,
  )   : id = snapshot.id,
        email = snapshot['email'],
        firstName = snapshot['firstName'],
        lastName = snapshot['lastName'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
      };

  User.fromJson(
    Map<String, dynamic> json,
  )   : id = json['id'],
        email = json['email'],
        firstName = json['firstName'],
        lastName = json['lastName'];
}
