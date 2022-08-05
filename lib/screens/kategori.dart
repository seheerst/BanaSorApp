import 'package:flutter/material.dart';

class KategoriScreen extends StatelessWidget {
  const KategoriScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'Aşk',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'İnanç',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'İş',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'Günlük Yaşam',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'spor',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'Müzik',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'Siyaset',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'Teknoloji',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'Yemek',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'Diziler',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'Sağlık',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'Bilim',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'Felsefe',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'Hayvanlar',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'Magazin',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(const Size.fromWidth(50))),
          onPressed: () {},
          child: const Text(
            'Moda',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
