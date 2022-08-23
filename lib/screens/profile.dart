// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bana_sor_app/widgets/settingsDrawer.dart';
import 'package:bana_sor_app/widgets/profileAppbar.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../constants/sabitler.dart';
import 'add_entry.dart';
import 'homePage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  FirebaseAuth auth = FirebaseAuth.instance;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.settings,
                    size: 40,
                    color: Sabitler.anaRenk,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ],
          bottom: TabBarim(),
          flexibleSpace: const ProfileAppbar(),
          leading: BackButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Anasayfa()));
            },
            color: Sabitler.anaRenk,
          ),
        ),
      ),
      endDrawer: const AppDrawer(),
      body: TabBarView(

        controller: tabController,
        children: const [
          KullaniciGonderileri(),
          Center(
            child: Text(
              'Burada gösterilecek birşey yok',
              style: TextStyle(fontSize: 25, color: Sabitler.anaRenk),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        backgroundColor: Sabitler.anaRenk,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddEntryScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  TabBar TabBarim() {
    return TabBar(
      enableFeedback: true,
      controller: tabController,
      tabs: const [
        Tab(
          child: Text("Entry'ler",
              style: TextStyle(color: Sabitler.anaRenk, fontSize: 18)),
        ),
        Tab(
          child: Text("Beğeniler",
              style: TextStyle(color: Sabitler.anaRenk, fontSize: 18)),
        )
      ],
    );
  }
}

class KullaniciGonderileri extends StatefulWidget {
  const KullaniciGonderileri({Key? key}) : super(key: key);

  @override
  _KullaniciGonderileriState createState() => _KullaniciGonderileriState();
}

class _KullaniciGonderileriState extends State<KullaniciGonderileri> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Query gonderi = FirebaseFirestore.instance
        .collection('gonderiler')
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
                                  SizedBox(width: 310,),
                                  Text( '${data['gonderiZamani']} , ${data['gonderiSaati']} ')
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
                              data['baslik'] ,
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
                                icon: Icon(Icons.comment,size: 25,),
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
