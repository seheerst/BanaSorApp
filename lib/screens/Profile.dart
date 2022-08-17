// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bana_sor_app/widgets/AyarlarDrawer.dart';
import 'package:bana_sor_app/widgets/ProfileAppbar.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../constants/sabitler.dart';
import 'add_entry.dart';
import 'anasayfa.dart';

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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text(data['baslik']),
                    subtitle: Text(data['icerik']),
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
                          size: 30,
                          likeCount: 300,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.comment,
                                color: Sabitler.anaRenk,
                                size: 30,
                              )),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share),
                          color: Sabitler.anaRenk,
                          iconSize: 30,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
