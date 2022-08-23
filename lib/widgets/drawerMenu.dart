// ignore_for_file: file_names, non_constant_identifier_names, library_private_types_in_public_api

import 'package:bana_sor_app/screens/LoginPage.dart';
import 'package:bana_sor_app/widgets/settingsDrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/profile.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var kullnaniciEmail = '';
  var kullaniciAdi = '';

  BilgiGetir() {
    _firestore
        .collection('Users')
        .doc('Users/65Qu6bcrdXeFWPwh8TCijdBpCcn2')
        .get()
        .then((gelenDeger) {
      setState(() {
        kullnaniciEmail = gelenDeger.data()!['Mail'];
        kullaniciAdi = gelenDeger.data()!['kullaniciAdi'];
        debugPrint(kullnaniciEmail);
      });
    });
  }

  String? indirmeBaglantisi;

  @override
  void initState() {
    baglantiAl();
    //WidgetsBinding.instance.addPersistentFrameCallback((_) => baglantiAl());
    super.initState();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  baglantiAl() async {
    Reference baglanti = await FirebaseStorage.instance
        .ref()
        .child('ProfilResimleri')
        .child(auth.currentUser!.uid)
        .child('pp.jpg');

        String deneme = await (await baglanti).getDownloadURL();

        //Future<String> deneme2 = baglanti.getDownloadURL().whenComplete(() {


        //});
     setState(() {
       indirmeBaglantisi = deneme;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 400,
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                ClipOval(
                    child: Image.network(
                  indirmeBaglantisi ??
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                  width: 100,
                  height: 100,
                )),
                const Expanded(
                  child: KullaniciBilgileri(),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Profil'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfileScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Ayarlar'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AppDrawer()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Yardım'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Çıkış'),
            onTap: () async {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              });
              await GoogleSignIn().disconnect();
            },
          ),
        ],
      ),
    );
  }
}

class KullaniciBilgileri extends StatefulWidget {
  const KullaniciBilgileri({Key? key}) : super(key: key);

  @override
  _KullaniciBilgileriState createState() => _KullaniciBilgileriState();
}

class _KullaniciBilgileriState extends State<KullaniciBilgileri> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Query gonderi = FirebaseFirestore.instance
        .collection('Users')
        .where('mail', isEqualTo: auth.currentUser!.email);

    return StreamBuilder<QuerySnapshot>(
      stream: gonderi.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      data['mail'],
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      data['kullaniciAdi'],
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
