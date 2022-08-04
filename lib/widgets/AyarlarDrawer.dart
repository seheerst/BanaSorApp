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
        title: Text(
          'Ayarlar',
          style: TextStyle(color:Sabitler.anaRenk),
          textAlign: TextAlign.center,
        ),
        iconTheme: IconThemeData(color:Sabitler.anaRenk),
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
          ListTileWidget('Çıkış'),


        ],
      )
    );
  }
  ListTileWidget(String baslik){
      return ListTile(

        title: Text(baslik, style: TextStyle(fontSize: 20),),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward_ios,color: Sabitler.anaRenk,),
          onPressed: (){},
        )
      );
  }
}
