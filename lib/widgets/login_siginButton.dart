import 'package:flutter/material.dart';

import '../constants/sabitler.dart';

Container fireBaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: 180,
    decoration: BoxDecoration(
        color: Sabitler.ikinciRenk,
        borderRadius: BorderRadius.circular(24)),
    child: TextButton(
        onPressed: () {
          onTap();
        },
        child: Text(
          title,
          style: TextStyle(
              fontSize: 25, color: Sabitler.loginArka),
        )),
  );
}