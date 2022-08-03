import 'package:flutter/material.dart';

class GundemScreen extends StatelessWidget {
  const GundemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          TextButton(
            
            style: ButtonStyle(
              minimumSize:MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 80)) ,
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(
                const Size.fromWidth(50),
              ),
            ),
            onPressed: () {},
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Aşk Gündemi',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          TextButton(
            
            style: ButtonStyle(
              minimumSize:MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 80)) ,
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(
                const Size.fromWidth(50),
              ),
            ),
            onPressed: () {},
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sağlık Gündemi',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          TextButton(
            
            style: ButtonStyle(
              minimumSize:MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 80)) ,
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(
                const Size.fromWidth(50),
              ),
            ),
            onPressed: () {},
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Siyaset Gündemi',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          TextButton(
            
            style: ButtonStyle(
              minimumSize:MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 80)) ,
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(
                const Size.fromWidth(50),
              ),
            ),
            onPressed: () {},
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Teknoloji Gündemi',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          TextButton(
            
            style: ButtonStyle(
              minimumSize:MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 80)) ,
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(
                const Size.fromWidth(50),
              ),
            ),
            onPressed: () {},
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Magazin Gündemi',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          TextButton(
            
            style: ButtonStyle(
              minimumSize:MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 80)) ,
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(
                const Size.fromWidth(50),
              ),
            ),
            onPressed: () {},
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Bilim Gündemi',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          TextButton(
            
            style: ButtonStyle(
              minimumSize:MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 80)) ,
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(
                const Size.fromWidth(50),
              ),
            ),
            onPressed: () {},
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Müzik Gündemi',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}
