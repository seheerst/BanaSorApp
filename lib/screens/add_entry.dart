import 'package:bana_sor_app/constants/sabitler.dart';
import 'package:bana_sor_app/widgets/dropDown.dart';
import 'package:flutter/material.dart';

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({Key? key}) : super(key: key);

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              color: Colors.white,
              child: Column(
                children: [

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Sabitler.anaRenk),
                    ),
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Başlık...',
                              hintStyle: TextStyle(color: Sabitler.anaRenk),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Sabitler.anaRenk,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        maxLines: 12,
                        decoration: const InputDecoration(
                            hintText: 'Bugün ne düşünüyorsun?',
                            hintStyle: TextStyle(color: Sabitler.anaRenk),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: DropDown(),
                      ),
                      TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Sabitler.anaRenk)),
                          onPressed: () {},
                          child: Text(
                            'Yayınla',
                            style: TextStyle(
                              color: Colors.white
                            ),

                          ),)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
