import 'package:bana_sor_app/screens/categories/askGonderiler.dart';
import 'package:bana_sor_app/screens/categories/bilimGonderiler.dart';
import 'package:bana_sor_app/screens/categories/diziGonderiler.dart';
import 'package:bana_sor_app/screens/categories/felsefeGonderiler.dart';
import 'package:bana_sor_app/screens/categories/gunlukYasamGonderiler.dart';
import 'package:bana_sor_app/screens/categories/hayvanGonderiler.dart';
import 'package:bana_sor_app/screens/categories/inancgonderiler.dart';
import 'package:bana_sor_app/screens/categories/isGonderiler.dart';
import 'package:bana_sor_app/screens/categories/magazinGonderiler.dart';
import 'package:bana_sor_app/screens/categories/modaGonderiler.dart';
import 'package:bana_sor_app/screens/categories/muzikGonderiler.dart';
import 'package:bana_sor_app/screens/categories/sagl%C4%B1kGonderiler.dart';
import 'package:bana_sor_app/screens/categories/siyasetGonderiler.dart';
import 'package:bana_sor_app/screens/categories/sporGonderiler.dart';
import 'package:bana_sor_app/screens/categories/teknolojiGonderiler.dart';
import 'package:bana_sor_app/screens/categories/yemekGonderiler.dart';
import 'package:flutter/material.dart';

import 'categories/askGonderiler.dart';

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
