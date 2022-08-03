import 'package:bana_sor_app/constants/sabitler.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class YeniScreen extends StatelessWidget {
  const YeniScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.black38)),
              width: MediaQuery.of(context).size.width - 80,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: const Text(''),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        const LikeButton(
                          
                          bubblesColor: BubblesColor(dotPrimaryColor: Sabitler.anaRenk, dotSecondaryColor: Sabitler.ikinciRenk),
                          circleColor: CircleColor(start: Sabitler.anaRenk,end: Sabitler.ikinciRenk),
                          size: 40,
                          likeCount: 300,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.comment,
                                color: Colors.black45,
                                size: 40,
                              )),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share),
                          color: Colors.black45,
                          iconSize: 40,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
