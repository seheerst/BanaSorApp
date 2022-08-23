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

String ase = '65Qu6bcrdXeFWPwh8TCijdBpCcn2';

class _SifreDegistirScreenState extends State<SifreDegistirScreen> {
  final _formKey = GlobalKey<FormState>();
  var newPassword = '';
  final _newPasswordController = TextEditingController();
  final _currentPasswordController = TextEditingController();
  final _newPassAgainController = TextEditingController();
  bool checkCurrentPassValid = true;

  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _newPassAgainController.dispose();
    _currentPasswordController.dispose();
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  controller: _currentPasswordController,
                  obscureText: true,
                  decoration:  InputDecoration(
                    hintText: 'Eski Şifreniz',
                    hintStyle: TextStyle(fontSize: 20, color: Sabitler.anaRenk),
                    errorText: checkCurrentPassValid ? null : "Şifrenizi kontrol ediniz",
                  ),
                ),
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Yeni Şifreniz',
                    hintStyle: TextStyle(fontSize: 20, color: Sabitler.anaRenk),
                  ),
                ),
                TextFormField(
                  controller: _newPassAgainController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Yeni Şifre Tekrar',
                    hintStyle: TextStyle(fontSize: 20, color: Sabitler.anaRenk),
                  ),
                  validator: (value) {
                    return _newPasswordController.text == value
                        ? null
                        : 'Şifreler Aynı Değil';
                  },
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Sabitler.anaRenk)),
                  onPressed: () async {
                    checkCurrentPassValid =
                    await validatePassword(_currentPasswordController.text);


                    setState(() {});



                    if (_formKey.currentState!.validate() && checkCurrentPassValid) {

                      auth.currentUser!.updatePassword(_newPasswordController.text).whenComplete(() {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()));
                      });

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Sabitler.anaRenk,
                        content: Text('Şifreniz Güncellendi.. Lütfen Tekrar Giriş Yapın'),
                      ));;

                    }
                  },
                  child: const Text(
                    'Şifremi Güncelle',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  FirebaseAuth auth = FirebaseAuth.instance;
  Future<bool> validatePassword(String password) async {

    var firebaseUser = auth.currentUser;
    var authCredentials = EmailAuthProvider.credential(
        email: firebaseUser!.email!, password: password);
    try {
      var authResult = await currentUser!
          .reauthenticateWithCredential(authCredentials);
      return authResult.user != null;
    } catch (e) {
      print(e);
      return false;
    }
  }


}
