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

class _SifreDegistirScreenState extends State<SifreDegistirScreen> {
  final _formKey = GlobalKey<FormState>();
  var newPassword = '';
  final newPasswordController = TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 300,
          child: Column(
            key: _formKey,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            TextFormField(
            controller: newPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Lütfen Şifre Giriniz';
              }
              return null;
            },
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        newPassword = newPasswordController.text;
                      });
                      changePassword();
                    }
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

  Widget myTextField(String baslik) {
    return TextFormField(
      controller: newPasswordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Yeni Şifre';
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        hintText: baslik,
        hintStyle: const TextStyle(fontSize: 20, color: Sabitler.anaRenk),
      ),
    );
  }

  changePassword() async {
    try {
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));

    // ignore: empty_catches
    } catch (error) {}
  }
}
