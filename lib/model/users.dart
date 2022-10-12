import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.sdu,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.sdt,
    required this.dob,
  });
  final String sdu;
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String dob;
  final String sdt;
  UserModel.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        email = snapshot['email'],
        sdu = snapshot['sdu'],
        firstName = snapshot['firstname'],
        lastName = snapshot['lastname'],
        gender = snapshot['gender'],
        dob = snapshot['dob'],
        sdt = snapshot['sdt'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'sdu': sdu,
        'firstname': firstName,
        'lastName': lastName,
        'gender': gender,
        'dob': dob,
        'sdt': sdt,
      };
  UserModel.fromJson(
    Map<String, dynamic> json,
  )   : id = json['id'],
        email = json['email'],
        sdu = json['sdu'],
        firstName = json['firstname'],
        lastName = json['lastname'],
        gender = json['gender'],
        dob = json['dob'],
        sdt = json['sdt'];
}
