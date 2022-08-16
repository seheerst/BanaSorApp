// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../constants/sabitler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Container fireBaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: 180,
    decoration: BoxDecoration(
        color: Sabitler.ikinciRenk, borderRadius: BorderRadius.circular(24)),
    child: TextButton(
        onPressed: () {
          onTap();

        },
        child: Text(
          title,
          style: const TextStyle(fontSize: 25, color: Sabitler.loginArka),
        )),
  );
}
class FirebaseCollections extends StatefulWidget {
  const FirebaseCollections({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FirebaseCollectionsState createState() => _FirebaseCollectionsState();
}

class _FirebaseCollectionsState extends State<FirebaseCollections> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var userRef = _firestore.doc('User1');
    debugPrint(userRef.get().toString());
    return Container();
  }
}
