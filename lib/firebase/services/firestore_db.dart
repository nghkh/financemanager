import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseFirestore.instance.collection('users').get().then(
        (snapshot) => snapshot.docs.forEach(
          (doc) => print(doc.data()),
        ),
      );
}
// Future<void> main(List<String> args) async {
//   await FirebaseFirestore.instance
//       .collection('users')
//       .get()
//       .then((snapshot) => snapshot.docs.forEach((element) {
//             print(element.reference);
//           }));
// }
