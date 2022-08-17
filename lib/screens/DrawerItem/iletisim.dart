import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants/sabitler.dart';

class IletisimScreen extends StatelessWidget {
  const IletisimScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'İletişim',
            style: TextStyle(fontSize: 20, color: Sabitler.anaRenk),
          ),
          iconTheme: const IconThemeData(color: Sabitler.anaRenk),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {},
                title: Text(
                  'Bize Ulaşın',
                  style: const TextStyle(fontSize: 15, color: Colors.black54),
                ),
                subtitle: Text('BanaSor@gmail.com',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
              Divider(
                color: Colors.black,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sosyal Medya Hesaplarımız',
                      style: TextStyle(fontSize: 19),
                    ),
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.facebook,
                            color: Sabitler.anaRenk,
                          ),
                          label: Text('/Bana Sor'),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.instagram,
                            color: Sabitler.anaRenk,
                          ),
                          label: Text('/BanaSorApp'),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.twitter,
                            color: Sabitler.anaRenk,
                          ),
                          label: Text('/BanaSor'),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
