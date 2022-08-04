import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      image: DecorationImage(
                          image: AssetImage('assets/images/pp.jpg'))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 80),
                child: Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      const Text('Kullanıcı Adı',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:[
                            Column(
                              children: const[
                                Text(
                                  '0',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),

                                Text('entry',style: TextStyle(color: Colors.black45,fontSize: 17),),
                              ],
                            ),
                            Column(
                              children: const[
                                Text(
                                  '0',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),

                                Text('entry',style: TextStyle(color: Colors.black45,fontSize: 17),),
                              ],
                            ),
                            Column(
                              children: const[
                                Text(
                                  '0',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),

                                Text('entry',style: TextStyle(color: Colors.black45,fontSize: 17),),
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.facebookF,color: Colors.black45,)),
                          IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.twitter,color: Colors.black45,)),
                          IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.instagram,color: Colors.black45,)),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }

