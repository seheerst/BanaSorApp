import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
   String dropDownValue ='Kategori';
   int index =0;

  var kategoriListesi= ['Kategori','iş','İnanç','Günlük Hayat','Aşk','Spor','Müzik','siyaset','Teknoloji','Yemek','Diziler','Sağlık','Bilim','Felsefe','Hayvanlar','Magazin','Moda'];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
                  value: dropDownValue  ,
                 icon:const Icon(Icons.arrow_drop_down_outlined),
                 items: kategoriListesi.map((String value){
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                 } ).toList(),
                 onChanged: (String? newValue){
                  setState(() {
                    
                    dropDownValue= newValue!;
                  });
                 },
                 );
  }
}