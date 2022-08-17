import 'package:bana_sor_app/screens/DrawerItem/emailDegistir.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/sabitler.dart';

class KisiselBilgilerScreen extends StatefulWidget {
  KisiselBilgilerScreen({Key? key}) : super(key: key);

  @override
  _KisiselBilgilerScreenState createState() => _KisiselBilgilerScreenState();
}

class _KisiselBilgilerScreenState extends State<KisiselBilgilerScreen> {
  @override
  void initState() {
    kullaniciBilgisi();
    super.initState();
  }

  String email = '';
  String telefon = '';
  String dogumGunu = '';

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  void kullaniciBilgisi() {
    _firestore
        .collection('Users')
        .doc(auth.currentUser?.uid)
        .get()
        .then((snapshot) {
      setState(() {
        email = snapshot.data()!['mail'];
        telefon = snapshot.data()!['telefon'];
        dogumGunu = snapshot.data()!['dogumGunu'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Kişisel Bilgiler',
          style: TextStyle(fontSize: 20, color: Sabitler.anaRenk),
        ),
        iconTheme: const IconThemeData(color: Sabitler.anaRenk),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTileWidget('E-posta', email, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EmailDegistirScreen()));
            }),
            Divider(
              height: 1,
              color: Colors.black54,
            ),
            ListTileWidget('Telefon Numarası', telefon, () {}),
            Divider(
              height: 1,
              color: Colors.black54,
            ),
            ListTileWidget('Doğum Günü', dogumGunu, () {}),
            Divider(
              height: 1,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    ));
  }

  ListTileWidget(String baslik, String bilgi, Function onTap) {
    return ListTile(
      onTap: () {
        onTap();
      },
      subtitle: Text(
        bilgi,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
      title: Text(
        baslik,
        style: const TextStyle(fontSize: 15, color: Colors.black54),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Sabitler.anaRenk,
      ),
    );
  }
}
