

import 'package:bana_sor_app/constants/sabitler.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                        loginTextField('E-mail'),
                        const SizedBox(
                          height: 15,
                        ),
                        loginTextField('Şifre'),
                        TextButton(
                          onPressed: () {},
                          child: const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Şifremi Unuttum',
                                style: TextStyle(
                                    color: Sabitler.ikinciRenk, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 180,
                          decoration: BoxDecoration(
                              color: Sabitler.ikinciRenk,
                              borderRadius: BorderRadius.circular(24)),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Giriş Yap',
                                style: TextStyle(
                                    fontSize: 25, color: Sabitler.loginArka),
                              )),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Hesabınız yok mu? Kayıt Olun',
                              style:  TextStyle(
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
                                'Google ile giriş yap',
                                style:  TextStyle(
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

  Container loginTextField(String text) {
    return Container(
      height: 70,
      width: 400,
      decoration: BoxDecoration(
          color: Sabitler.ikinciRenk, borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.only(top: 7.0, left: 10),
        child: TextFormField(
          inputFormatters: const [],
          decoration: InputDecoration(
              hintText: text,
              hintStyle: const TextStyle(color: Sabitler.anaRenk, fontSize: 24),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
