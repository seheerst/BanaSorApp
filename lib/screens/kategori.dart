import 'package:bana_sor_app/screens/kategoriler/askGonderiler.dart';
import 'package:bana_sor_app/screens/kategoriler/bilimGonderiler.dart';
import 'package:bana_sor_app/screens/kategoriler/diziGonderiler.dart';
import 'package:bana_sor_app/screens/kategoriler/felsefeGonderiler.dart';
import 'package:bana_sor_app/screens/kategoriler/gunlukYasamGonderiler.dart';
import 'package:bana_sor_app/screens/kategoriler/hayvanGonderiler.dart';
import 'package:bana_sor_app/screens/kategoriler/inancgonderiler.dart';
import 'package:bana_sor_app/screens/kategoriler/isGonderiler.dart';
import 'package:bana_sor_app/screens/kategoriler/magazinGonderiler.dart';
import 'package:bana_sor_app/screens/kategoriler/modaGonderiler.dart';
import 'package:bana_sor_app/screens/kategoriler/muzikGonderiler.dart';
import 'package:bana_sor_app/screens/kategoriler/sagl%C4%B1kGonderiler.dart';
import 'package:bana_sor_app/screens/kategoriler/siyasetGonderiler.dart';
import 'package:bana_sor_app/screens/kategoriler/sporGonderiler.dart';
import 'package:bana_sor_app/screens/kategoriler/teknolojiGonderiler.dart';
import 'package:bana_sor_app/screens/kategoriler/yemekGonderiler.dart';
import 'package:flutter/material.dart';

class KategoriScreen extends StatelessWidget {
  const KategoriScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AskGonderileriScreen()));
          },
          child: const Text(
            'Aşk',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> InancGonderileriScreen()));},
          child: const Text(
            'İnanç',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> IsGonderileriScreen()));},
          child: const Text(
            'İş',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> GunlukYasamGonderileriScreen()));},
          child: const Text(
            'Günlük Yaşam',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> SporGonderileriScreen()));},
          child: const Text(
            'spor',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> MuzikGonderileriScreen()));},
          child: const Text(
            'Müzik',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> SiyasetGonderileriScreen()));},
          child: const Text(
            'Siyaset',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> TeknolojiGonderileriScreen()));},
          child: const Text(
            'Teknoloji',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> YemekGonderileriScreen()));},
          child: const Text(
            'Yemek',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> DiziGonderileriScreen()));},
          child: const Text(
            'Diziler',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SaglikGonderileriScreen()));
          },
          child: const Text(
            'Sağlık',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> BilimGonderileriScreen()));},
          child: const Text(
            'Bilim',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> FelsefeGonderileriScreen()));},
          child: const Text(
            'Felsefe',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> HayvanGonderileriScreen()));},
          child: const Text(
            'Hayvanlar',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> MagazinGonderileriScreen()));},
          child: const Text(
            'Magazin',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> ModaGonderileriScreen()));},
          child: const Text(
            'Moda',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
