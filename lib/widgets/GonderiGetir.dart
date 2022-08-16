// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../constants/sabitler.dart';

class GonderiGetir extends StatefulWidget {
  const GonderiGetir({Key? key}) : super(key: key);

  @override
  _GonderiGetirState createState() => _GonderiGetirState();
}

class _GonderiGetirState extends State<GonderiGetir> {
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(children: [
                    ClipOval(child: Image.network( 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',width: 50,height: 50,),),
                  const SizedBox(width: 10,),
                    const Text('Kullanıcı Adı')
                  ],),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.black38)),
                      width: MediaQuery.of(context).size.width - 80,
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,

                            child: ListTile(
                              contentPadding: const EdgeInsets.all(25),
                              title: Text(data['baslik'], style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                              subtitle: Text(data['icerik'],style: const TextStyle(color: Colors.black,fontSize: 18),),
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
                                  size: 40,
                                  likeCount: 300,

                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.comment,
                                        color: Sabitler.anaRenk,
                                        size: 40,
                                      )),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share),
                                  color: Sabitler.anaRenk,
                                  iconSize: 40,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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