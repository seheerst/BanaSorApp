import 'package:bana_sor_app/constants/sabitler.dart';


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailDegistirScreen extends StatefulWidget {
  const EmailDegistirScreen({Key? key}) : super(key: key);

  @override
  _EmailDegistirScreenState createState() => _EmailDegistirScreenState();
}

class _EmailDegistirScreenState extends State<EmailDegistirScreen> {
  final _formKey = GlobalKey<FormState>();
  var newmail = '';
  final newEmailController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  void dispose() {
    newEmailController.dispose();
    super.dispose();
  }

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
                controller: newEmailController,
                decoration: const InputDecoration(
                  hintText: 'Yeni E-Posta',
                  hintStyle: TextStyle(fontSize: 20, color: Sabitler.anaRenk),
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Sabitler.anaRenk)),
                  onPressed: () async {
                    changeEmail();
                  },
                  child: const Text(
                    "E-posta'yı Güncelle",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  changeEmail() async {
    try {
      FirebaseAuth.instance.currentUser?.updateEmail(newEmailController.text);
      debugPrint(currentUser!.email);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Sabitler.anaRenk,
        content: Text('E-mail Adresiniz Başarıyla Güncellendi'),
      ));
    } catch (e) {
      print('hata: $e');
    }
  }
}
