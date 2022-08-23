import 'package:bana_sor_app/constants/sabitler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'homePage.dart';

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
          padding: const EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 200,
                    height: 30,
                    child: KullaniciBilgileriGetir()),
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
    );
  }

  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('dd/MM');
  final DateFormat formatter1 = DateFormat('HH:mm');
  late String formatted;
  late String formatted1;
  zaman(){
   formatted = formatter.format(now).toString();

   return formatted;
  }

  saat(){
    formatted1 = formatter1.format(now).toString();
    return formatted1;
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
      'ProfilePhoto': ppUrl,
      'kullaniciAdi': kullaniciAdi,
      'gonderiZamani': zaman(),
      'gonderiSaati' : saat()

    }).whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context) => const Anasayfa())));
  }

  String indirmeBaglantisi = '';
  String kullaniciAdi = '';
  String ppUrl= '';



  void initState() {
    baglantiAl();
    super.initState();
  }




  baglantiAl() async {
    Reference baglanti = await FirebaseStorage.instance
        .ref()
        .child('ProfilResimleri')
        .child(auth.currentUser!.uid)
        .child('pp.jpg');

    String deneme = await (await baglanti).getDownloadURL();

    setState(() {
      indirmeBaglantisi = deneme;
    });


  }



  KullaniciBilgileriGetir(){
    Query gonderi = FirebaseFirestore.instance
        .collection('Users')
        .where('mail', isEqualTo: auth.currentUser!.email);



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
            ppUrl = data['profilePhoto'];
            kullaniciAdi= data['kullaniciAdi'];
            return
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: ClipOval(
                        child: Image.network(indirmeBaglantisi )),
                  ),
                  SizedBox(width: 10,),
                  Text(kullaniciAdi, style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                ],
              );


          }).toList(),
        );
      },
    );
  }


}



