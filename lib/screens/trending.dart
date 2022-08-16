
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../widgets/GonderiGetir.dart';

class TrendScreen extends StatefulWidget {
  TrendScreen({Key? key}) : super(key: key);

  @override
  State<TrendScreen> createState() => _TrendScreenState();
}

class _TrendScreenState extends State<TrendScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      body: GonderiGetir(),
    );
  }
}


