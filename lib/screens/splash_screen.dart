import 'package:bana_sor_app/constants/sabitler.dart';
import 'package:bana_sor_app/screens/LoginPage.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _splashScreenState createState() => _splashScreenState();
}

// ignore: camel_case_types
class _splashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds:4500 ),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Sabitler.ikinciRenk,
      child: const Center(
            child:
                Image(
                  image: AssetImage('assets/images/logo1.png'),
                  width: 400,
                )
          ),
    );
    
  }
}
