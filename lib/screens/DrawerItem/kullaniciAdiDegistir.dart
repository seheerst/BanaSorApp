import 'package:bana_sor_app/constants/sabitler.dart';
import 'package:bana_sor_app/widgets/AyarlarDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class KullaniciAdiDegistirScreen extends StatefulWidget {
  const KullaniciAdiDegistirScreen({Key? key}) : super(key: key);

  @override
  _KullaniciAdiDegistirScreenState createState() => _KullaniciAdiDegistirScreenState();
}

class _KullaniciAdiDegistirScreenState extends State<KullaniciAdiDegistirScreen> {
  final _formKey = GlobalKey<FormState>();
  var newmail = '';
  final _newKullaniciAdiController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  void dispose() {
    _newKullaniciAdiController.dispose();
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
                controller: _newKullaniciAdiController,
                decoration: const InputDecoration(
                  hintText: 'Yeni Kullanıcı Adı',
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
                    "Kullanıcı Adımı Güncelle",
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
      'kullaniciAdi': _newKullaniciAdiController.text,

    },SetOptions(merge: true)
    ).whenComplete(() => print('kullaniciAdi Değiştirildi'));
  }

}