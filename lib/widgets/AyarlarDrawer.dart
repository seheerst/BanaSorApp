// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:bana_sor_app/constants/sabitler.dart';

import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
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
            ListTileWidget('Tercihler'),
            ListTileWidget('Kişisel Bilgiler'),
            ListTileWidget('e-mail adresimi değiştir'),
            ListTileWidget('Şifremi değiştir'),
            ListTileWidget('Kullanım Koşulları'),
            ListTileWidget('İletişim'),
            ListTileWidget('Gizlilik Politikası'),
          ],
        ));
  }

  ListTileWidget(String baslik) {
    return ListTile(
      onTap: () {},
      title: Text(
        baslik,
        style: const TextStyle(fontSize: 20),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Sabitler.anaRenk,
      ),
    );
  }
}
