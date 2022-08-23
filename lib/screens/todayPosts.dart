import 'package:bana_sor_app/constants/sabitler.dart';
import 'package:bana_sor_app/widgets/gonderiGetir.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';

class YeniScreen extends StatefulWidget {
  const YeniScreen({Key? key}) : super(key: key);

  @override
  State<YeniScreen> createState() => _YeniScreenState();
}

class _YeniScreenState extends State<YeniScreen> {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('dd/MM');
  late String formatted = formatter.format(now).toString();

  @override
  Widget build(BuildContext context) {
    Query gonderi = FirebaseFirestore.instance
        .collection('gonderiler')
        .where('gonderiZamani', isEqualTo: '$formatted');
    return Scaffold(body: bugunGonderisiGetir(gonderi));
  }

  StreamBuilder<QuerySnapshot<Object?>> bugunGonderisiGetir(
      Query<Object?> gonderi) {
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
                                  Text('${data['kullaniciAdi']}'),
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
                                onPressed: () {},
                                icon: Icon(
                                  Icons.comment,
                                  size: 25,
                                ),
                                color: Sabitler.anaRenk,
                              ),
                              IconButton(
                                onPressed: () {},
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
}
