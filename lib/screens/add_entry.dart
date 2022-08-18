import 'package:bana_sor_app/constants/sabitler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'anasayfa.dart';

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({Key? key}) : super(key: key);

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {

  FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController _baslikController = TextEditingController();
  final TextEditingController _icerikController = TextEditingController();

  String dropDownValue = 'Kategori';
  int index = 0;
  String kategori = '';
  var kategoriListesi = [
    'Kategori',
    'İş',
    'İnanç',
    'Günlük Hayat',
    'Aşk',
    'Spor',
    'Müzik',
    'siyaset',
    'Teknoloji',
    'Yemek',
    'Diziler',
    'Sağlık',
    'Bilim',
    'Felsefe',
    'Hayvanlar',
    'Magazin',
    'Moda'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: BackButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Anasayfa()));
                      },
                      color: Sabitler.anaRenk,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Sabitler.anaRenk),
                    ),
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextFormField(
                        controller: _baslikController,
                        decoration: const InputDecoration(
                            hintText: 'Başlık...',
                            hintStyle: TextStyle(color: Sabitler.anaRenk),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: Sabitler.anaRenk,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _icerikController,
                            maxLines: 12,
                            decoration: const InputDecoration(
                                hintText: 'Bugün ne düşünüyorsun?',
                                hintStyle: TextStyle(color: Sabitler.anaRenk),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_a_photo,
                              color: Sabitler.anaRenk,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     DropdownButton(
                        value: dropDownValue,
                        icon: const Icon(Icons.arrow_drop_down_outlined),
                        items: kategoriListesi.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {

                          setState(() {
                            dropDownValue = newValue!;
                            kategori = newValue.toString();
                            print(kategori);
                          });
                        },
                      ),
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Sabitler.anaRenk)),
                        onPressed: () {
                          yaziEkle();
                        },
                        child: const Text(
                          'Yayınla',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  yaziEkle() {
    FirebaseFirestore.instance
        .collection('gonderiler')
        .doc(_baslikController.text)
        .set({
      'baslik': _baslikController.text,
      'icerik': _icerikController.text,
      'kullaniciid': auth.currentUser?.uid,
      'kategori' : kategori,
    }).whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context) => const Anasayfa())));
  }
}
