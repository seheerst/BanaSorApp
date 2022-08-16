import 'package:bana_sor_app/screens/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bana_sor_app/constants/sabitler.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/TextField.dart';
import '../widgets/login_siginButton.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {


  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();

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
                  height: 600,
                  width: MediaQuery.of(context).size.width - 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Sabitler.loginArka),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        loginTextField(
                            'Kullanıcı Adı', false, _userNameTextController),
                        const SizedBox(
                          height: 15,
                        ),
                        loginTextField('E-mail', false, _emailTextController),
                        const SizedBox(
                          height: 15,
                        ),

                        loginTextField(
                            'Password', true, _passwordTextController),
                        const SizedBox(
                          height: 15,
                        ),
                        fireBaseUIButton(context, 'Kayıt Ol', () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text)
                              .then((value) {
                            debugPrint("Created New Account");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          }).onError((error, stackTrace) {
                            debugPrint("Error ${error.toString()}");
                          });
                        }),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                            },
                            child: const Text(
                              'Hesabınız Var Mı? Giriş Yapın',
                              style: TextStyle(
                                  color: Sabitler.ikinciRenk, fontSize: 18),
                            )),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Sabitler.ikinciRenk)),
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesomeIcons.google,
                                color: Sabitler.loginArka,
                              ),
                              label: const Text(
                                'Google ile Kayıt Ol',
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

  yazdir() async {}
}
