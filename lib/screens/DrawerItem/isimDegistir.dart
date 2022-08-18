import 'package:bana_sor_app/constants/sabitler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class IsimDegistirScreen extends StatefulWidget {
  const IsimDegistirScreen({Key? key}) : super(key: key);

  @override
  _IsimDegistirScreenState createState() => _IsimDegistirScreenState();
}

class _IsimDegistirScreenState extends State<IsimDegistirScreen> {
  final _formKey = GlobalKey<FormState>();
  var newmail = '';
  final _newIsimController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  void dispose() {
    _newIsimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Sabitler.anaRenk),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 300,
          child: Column(
            key: _formKey,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                controller: _newIsimController,
                decoration: const InputDecoration(
                  hintText: 'Yeni Isim Soyisim',
                  hintStyle: TextStyle(fontSize: 20, color: Sabitler.anaRenk),
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Sabitler.anaRenk)),
                  onPressed: () async {
                    changeIsim();
                  },
                  child: const Text(
                    "İsim/Soyisim Güncelle",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  changeIsim() {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser?.email)
        .set({
      'isim': _newIsimController.text,

    },SetOptions(merge: true)
    ).whenComplete(() => print('isim Değiştirildi'));
  }

}
