
import 'package:bana_sor_app/widgets/AyarlarDrawer.dart';
import 'package:flutter/material.dart';

import '../constants/sabitler.dart';
import '../screens/Profile.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                color: Sabitler.anaRenk
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.person,
                  size: 110,
                  color: Colors.white,
                ),
                Text('\n\nKullanıcı@gmail.com\nKulanıcıAdı')
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Profil'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Ayarlar'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AppDrawer()));
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Yardım'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Çıkış'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}