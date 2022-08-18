// ignore_for_file: library_private_types_in_public_api

import 'package:bana_sor_app/constants/sabitler.dart';
import 'package:bana_sor_app/screens/LoginPage.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SifreDegistirScreen extends StatefulWidget {
  const SifreDegistirScreen({Key? key}) : super(key: key);

  @override
  _SifreDegistirScreenState createState() => _SifreDegistirScreenState();
}
String ase ='65Qu6bcrdXeFWPwh8TCijdBpCcn2';

class _SifreDegistirScreenState extends State<SifreDegistirScreen> {
  final _formKey = GlobalKey<FormState>();
  var newPassword = '';
  final newPasswordController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Sabitler.anaRenk),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 300,
          child: Column(
            key: _formKey,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                controller: newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Yeni Şifreniz',
                  hintStyle: TextStyle(fontSize: 20, color: Sabitler.anaRenk),
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Sabitler.anaRenk)),
                  onPressed: () async {
                    changePassword();

                  },
                  child: const Text(
                    'Şifremi Güncelle',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  changePassword() async {
    try {

     setState(() {
       newPassword= newPasswordController.text;
     });

      FirebaseAuth.instance.currentUser
          ?.updatePassword(newPassword).whenComplete(() {
        FirebaseAuth.instance.signOut();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });


      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Sabitler.anaRenk,
        content: Text('Şifreniz Güncellendi.. Lütfen Tekrar Giriş Yapın'),
      ));


    } catch (e) {
      print('hataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' + e.toString());
    }
  }
}
