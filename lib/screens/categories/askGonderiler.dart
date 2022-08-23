import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../constants/sabitler.dart';

class AskGonderileriScreen extends StatefulWidget {
  const AskGonderileriScreen({Key? key}) : super(key: key);

  @override
  _AskGonderileriScreenState createState() => _AskGonderileriScreenState();
}

FirebaseAuth auth = FirebaseAuth.instance;

class _AskGonderileriScreenState extends State<AskGonderileriScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Aşk ile ilgili Entry'ler",
          style: TextStyle(color: Sabitler.anaRenk),
          textAlign: TextAlign.center,
        ),
        iconTheme: const IconThemeData(color: Sabitler.anaRenk,),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: KategoriGonderisiGetir(),
    );
  }
}

class KategoriGonderisiGetir extends StatefulWidget {
  const KategoriGonderisiGetir({Key? key}) : super(key: key);

  @override
  _KategoriGonderisiGetirState createState() => _KategoriGonderisiGetirState();
}

class _KategoriGonderisiGetirState extends State<KategoriGonderisiGetir> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Query gonderi = FirebaseFirestore.instance
        .collection('gonderiler')
        .where('kategori', isEqualTo: 'Aşk');
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Kullanıcı Adı')
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                          Border.all(width: 0.5, color: Colors.black38)),
                      width: MediaQuery.of(context).size.width - 80,
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(25),
                              title: Text(
                                data['baslik'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              subtitle: Text(
                                data['icerik'],
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ),
                          Padding(
                              padding:
                              const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.comment,
                                    color: Sabitler.anaRenk,
                                    size: 30,
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
                                  TextButton(onPressed: (){}, child: Text('yayınla'))
                                ],
                              )),
                          Divider(),
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
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share),
                                  color: Sabitler.anaRenk,
                                  iconSize: 40,
                                )
                              ],
                            ),
                          ),
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
