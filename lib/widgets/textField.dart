import 'package:flutter/material.dart';

import '../constants/sabitler.dart';

Container loginTextField(
    String text, bool isPasswordType, TextEditingController controller) {
  return Container(
    height: 55,
    width: 400,
    decoration: BoxDecoration(
        color: Sabitler.ikinciRenk, borderRadius: BorderRadius.circular(24)),
    child: Padding(
      padding: const EdgeInsets.only(top: 7.0, left: 10),
      child: TextFormField(
        controller: controller,
        obscureText: isPasswordType,
        enableSuggestions: !isPasswordType,
        autocorrect: !isPasswordType,
        inputFormatters: const [],
        decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(color: Sabitler.anaRenk, fontSize: 24),
            border: InputBorder.none),
      ),
    ),
  );
}
