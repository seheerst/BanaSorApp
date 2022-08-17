// ignore_for_file: file_names, library_private_types_in_public_api

import 'dart:io';

import 'package:bana_sor_app/constants/sabitler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';


class ProfileAppbar extends StatefulWidget {
  const ProfileAppbar({Key? key}) : super(key: key);

  @override
  State<ProfileAppbar> createState() => _ProfileAppbarState();
}

class _ProfileAppbarState extends State<ProfileAppbar> {


  void initState() {
    baglantiAl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: ClipOval(
                      child: Image.network(indirmeBaglantisi ??
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png')),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: FloatingActionButton(
                          backgroundColor: Sabitler.anaRenk,
                          onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Fotoğraf Ekle'),
                                  content: SizedBox(
                                    width: 250,
                                    height: 120,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextButton.icon(
                                            onPressed: () {
                                              kameradanYukle();
                                            },
                                            icon: const Icon(
                                              Icons.camera_alt,
                                              color: Sabitler.anaRenk,
                                            ),
                                            label: const Text(
                                              'Kameradan çek',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )),
                                        TextButton.icon(
                                            onPressed: () {
                                              galeridenYukle();
                                            },
                                            icon: const Icon(
                                              Icons.photo_library_rounded,
                                              color: Sabitler.anaRenk,
                                            ),
                                            label: const Text('Galeriden Seç',
                                                style:  TextStyle(
                                                    color: Colors.black))),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          child: const Icon(Icons.add)),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 80),
            child: SizedBox(
              width: 300,
              child: Column(

                children: [
               const  Expanded(child: KullaniciBilgileri()),
                  Padding(
                    padding: const EdgeInsets.only( bottom: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'entry',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 17),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'takipçi',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 17),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'takip',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 17),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 35.0),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.black45,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.black45,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.instagram,
                              color: Colors.black45,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  File? yuklenecekDosya;
  String? indirmeBaglantisi;
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
  kameradanYukle() async {
    XFile? alinanDosya =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      yuklenecekDosya = File(alinanDosya!.path);
    });
    yukle();
  }

  galeridenYukle() async {
    Navigator.pop(context);
    XFile? alinanDosya =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      yuklenecekDosya = File(alinanDosya!.path);
    });
    yukle();
  }

  yukle() async {
    Reference referansYolu = FirebaseStorage.instance
        .ref()
        .child('ProfilResimleri')
        .child(auth.currentUser!.uid)
        .child('pp.jpg');

    UploadTask yuklemeGorevi = referansYolu.putFile(yuklenecekDosya!);

    String url = await (await yuklemeGorevi).ref.getDownloadURL();

    setState(() {
      indirmeBaglantisi = url;
      print('asdsadsada555555555 $indirmeBaglantisi');
    });
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
        .where('kullaniciid', isEqualTo: auth.currentUser!.uid);

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
            return
                Text(data['kullaniciAdi'], style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),);


          }).toList(),
        );
      },
    );
  }
}


