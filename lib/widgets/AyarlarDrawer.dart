// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:bana_sor_app/constants/sabitler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/sifreDegistir.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late FirebaseAuth auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ayarlar',
            style: TextStyle(color: Sabitler.anaRenk),
            textAlign: TextAlign.center,
          ),
          iconTheme: const IconThemeData(color: Sabitler.anaRenk),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
        ),
        body: ListView(
          children: [

            ListTileWidget('Kişisel Bilgiler', () {}, Icons.person,),
            ListTileWidget('e-mail adresimi değiştir', () {}, Icons.mail),
            ListTileWidget('Şifremi değiştir', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SifreDegistirScreen()));
            }, Icons.lock),
            ListTileWidget('Kullanım Koşulları', () {}, Icons.book ),
            ListTileWidget('İletişim', () {}, Icons.phone),
            ListTileWidget('Gizlilik Politikası', () {}, Icons.security),
          ],
        ));
  }

  ListTileWidget(String baslik, Function onTap, IconData icon) {
    return ListTile(
      onTap: () {
        onTap();
      },
      title: Text(
        baslik,
        style: const TextStyle(fontSize: 20),
      ),
      leading: Icon(icon),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Sabitler.anaRenk,
      ),
    );
  }
}
