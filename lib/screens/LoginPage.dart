// ignore_for_file: library_private_types_in_public_api, duplicate_ignore

import 'package:bana_sor_app/screens/signInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bana_sor_app/constants/sabitler.dart';
import 'package:bana_sor_app/screens/anasayfa.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/TextField.dart';
import '../widgets/login_siginButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  late FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: Sabitler.ikinciRenk),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage('assets/images/logo1.png')),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 420,
                  width: MediaQuery.of(context).size.width - 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Sabitler.loginArka),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        loginTextField(
                          'E-mail',
                          false,
                          _emailTextController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        loginTextField('Şifre', true, _passwordTextController),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ResetPassword()));
                          },
                          child: const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Şifremi Unuttum',
                                style: TextStyle(
                                    color: Sabitler.ikinciRenk, fontSize: 18),
                              )),
                        ),
                        fireBaseUIButton(context, 'Giriş Yap', () {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text)
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Anasayfa()));
                          }).onError((error, stackTrace) {
                            debugPrint("Error ${error.toString()}");
                          });
                        }),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen()));
                            },
                            child: const Text(
                              'Hesabınız yok mu? Kayıt Olun',
                              style: TextStyle(
                                  color: Sabitler.ikinciRenk, fontSize: 18),
                            )),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Sabitler.ikinciRenk)),
                              onPressed: () {googleIleGiris();},
                              icon: const Icon(
                                FontAwesomeIcons.google,
                                color: Sabitler.loginArka,
                              ),
                              label: const Text(
                                'Google ile giriş yap',
                                style: TextStyle(
                                    fontSize: 20, color: Sabitler.loginArka),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void googleIleGiris() async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
     await FirebaseAuth.instance.signInWithCredential(credential).then((value){
       Navigator.push(context, MaterialPageRoute(builder: (context)=> const Anasayfa()));
     });
  }
}

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late String _email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(left: 25, right: 25,top: 30),
                height: 120,
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'E-mail',
                      hintStyle:
                          TextStyle(fontSize: 25, color: Sabitler.anaRenk)),
                  onChanged: (value){
                    setState(() {
                      _email =value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20,),
            TextButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Sabitler.anaRenk)),
                onPressed: (){
                  FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
                  Navigator.of(context).pop();
                }, child: const Text('E-posta gönder',style: TextStyle(fontSize: 22,color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
