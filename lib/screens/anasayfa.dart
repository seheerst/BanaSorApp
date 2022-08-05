import 'package:bana_sor_app/constants/sabitler.dart';
import 'package:bana_sor_app/screens/kategori.dart';
import 'package:bana_sor_app/screens/trending.dart';
import 'package:bana_sor_app/screens/yeniler.dart';
import 'package:flutter/material.dart';

import '../widgets/DrawerMenu.dart';
import 'add_entry.dart';
import 'gundem.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa>
    with SingleTickerProviderStateMixin {
  // ignore: prefer_typing_uninitialized_variables
  var tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Sabitler.anaRenk.withOpacity(0.3),
                borderRadius: BorderRadius.circular(24)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                    hintText: 'Ne Aramıştın...',
                    hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          backgroundColor: Sabitler.anaRenk,
          bottom: tabBarWidget(),
        ),
        drawer: const DrawerMenu(),
        body: TabBarView(
          controller: tabController,
          children: const [
            TrendScreen(),
            YeniScreen(),
            GundemScreen(),
            KategoriScreen()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Sabitler.anaRenk,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddEntryScreen()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  TabBar tabBarWidget() {
    return TabBar(controller: tabController, tabs: const [
      Tab(
        child: Text(
          'Trendler',
          style: TextStyle(color: Colors.white),
        ),
      ),
      Tab(
        child: Text(
          'Bugün',
          style: TextStyle(color: Colors.white),
        ),
      ),
      Tab(
        child: Text(
          'Gündem',
          style: TextStyle(color: Colors.white),
        ),
      ),
      Tab(
        child: Text(
          'Kategoriler',
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
      )
    ]);
  }
}
