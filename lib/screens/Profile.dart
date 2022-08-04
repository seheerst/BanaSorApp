import 'package:bana_sor_app/widgets/AyarlarDrawer.dart';
import 'package:bana_sor_app/widgets/ProfileAppbar.dart';
import 'package:flutter/material.dart';
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
        preferredSize: Size.fromHeight(300),
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
          flexibleSpace: ProfileAppbar(),
          leading:  BackButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Anasayfa()));
            },
            color: Sabitler.anaRenk,
          ),
        ),
      ),
      endDrawer: AppDrawer(),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
           child: Center(
             child: Text('Henüz bir entry yayınlamadınız' , style: TextStyle(fontSize: 25,color:Sabitler.anaRenk),),
           ),
          ),
          Container(
            child: Center(
              child: Text('Burada gösterilecek birşey yok', style: TextStyle(fontSize: 25,color:Sabitler.anaRenk),),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Sabitler.anaRenk,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEntryScreen()));
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
