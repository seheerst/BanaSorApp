import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../constants/sabitler.dart';

class OtherProfileScreen extends StatefulWidget {
  OtherProfileScreen(
      {Key? key, required this.kullaniciAdi, required this.ppUrl})
      : super(key: key);

  late String kullaniciAdi;
  final String ppUrl;




  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  State<OtherProfileScreen> createState() => _OtherProfileScreenState();
}


class _OtherProfileScreenState extends State<OtherProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    print(widget.kullaniciAdi);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: AppBar(
          iconTheme: const IconThemeData(color: Sabitler.anaRenk),
          backgroundColor: Colors.white,
          title: Text(
            widget.kullaniciAdi,
            style: TextStyle(color: Sabitler.anaRenk),
          ),
          automaticallyImplyLeading: true,
          flexibleSpace: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ClipOval(
                        child: Image.network(
                          widget.ppUrl,
                          width: 120,
                          height: 120,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('0'),
                            Text('Entry'),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('0'),
                            Text('takipçi'),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('0'),
                            Text('takip'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('İsim Soyisim'),
                  ),

                ],
              )
            ],
          )),
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                child: Text(
                  "Entry'ler",
                  style: TextStyle(color: Sabitler.anaRenk),
                ),
              ),
              Tab(
                child: Text("Beğeniler",
                    style: TextStyle(color: Sabitler.anaRenk)),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          KullaniciGonderileri(kullaniciAdi:widget.kullaniciAdi, ppUrl: widget.ppUrl),
          Center(child: Text('burada gösterilecek birşey yok'),)
        ],
      ),
    );
  }
  
}
class KullaniciGonderileri extends StatefulWidget {
 KullaniciGonderileri({Key? key, required this.kullaniciAdi, required this.ppUrl}) : super(key: key);
String kullaniciAdi ;
String ppUrl;

@override
_KullaniciGonderileriState createState() => _KullaniciGonderileriState();
}

class _KullaniciGonderileriState extends State<KullaniciGonderileri> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Query gonderi = FirebaseFirestore.instance
        .collection('gonderiler')
        .where('kullaniciAdi', isEqualTo: widget.kullaniciAdi);

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

                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 60,

                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          child: Row(
                            children: [
                              ClipOval(
                                child: Image.network(
                                  widget.ppUrl,
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
                                  SizedBox(width: 310,),
                                  Text(
                                      '${data['gonderiZamani']} , ${data['gonderiSaati']} ')
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
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
                                icon: Icon(Icons.comment, size: 25,),
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