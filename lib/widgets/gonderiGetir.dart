// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:bana_sor_app/screens/otherProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';

import '../constants/sabitler.dart';

class GonderiGetir extends StatefulWidget {
  const GonderiGetir({Key? key}) : super(key: key);

  @override
  _GonderiGetirState createState() => _GonderiGetirState();
}

class _GonderiGetirState extends State<GonderiGetir> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final Stream<QuerySnapshot> _blogYazilari =
      FirebaseFirestore.instance.collection('gonderiler').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _blogYazilari,
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          child: Row(
                            children: [
                              ClipOval(
                                child: Image.network(
                                  data['ProfilePhoto'],
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> OtherProfileScreen(kullaniciAdi: data['kullaniciAdi'], ppUrl:  data['ProfilePhoto'])));
                                    },
                                    child: Text('${data['kullaniciAdi']}'),
                                  ),
                                  SizedBox(
                                    width: 310,
                                  ),
                                  Text(
                                      '${data['gonderiZamani']} , ${data['gonderiSaati']} ')
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            title: Text(
                              data['baslik'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            subtitle: Text(
                              data['icerik'],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.comment,
                                color: Sabitler.anaRenk,
                                size: 25,
                              ),
                              Expanded(
                                child: Container(
                                  height: 30,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '   yorum yap..',
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {}, child: Text('yayınla'))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              const LikeButton(
                                bubblesColor: BubblesColor(
                                    dotPrimaryColor: Sabitler.anaRenk,
                                    dotSecondaryColor: Sabitler.ikinciRenk),
                                circleColor: CircleColor(
                                    start: Sabitler.anaRenk,
                                    end: Sabitler.ikinciRenk),
                                size: 25,
                                likeCount: 300,
                              ),
                              IconButton(
                                onPressed: () {
                                  shareButtonWidget();
                                },
                                icon: const Icon(Icons.share),
                                color: Sabitler.anaRenk,
                                iconSize: 25,
                              )
                            ],
                          ),
                        ),
                        Divider(),
                      ],
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

  shareButtonWidget() {
    return Container(
      color: Colors.black,
      width: 200,
      height: 300,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(FontAwesomeIcons.instagram),
                onPressed: () {},
              )
            ],
          ),
          Row(),
        ],
      ),
    );
  }
}
