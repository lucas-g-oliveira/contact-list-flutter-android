// ignore_for_file: prefer_const_constructors
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:contact_list_flutter/models/contact_model.dart';
import 'package:flutter/material.dart';

Widget contactTile(Results contact) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(
          image: AssetImage(contact.imagePath != "none"
              ? contact.imagePath!
              : 'images/default.png'),
          width: 50,
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(contact.name!,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
              Text(contact.phoneNumber!, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        child: IconButton(
            onPressed: () async {
              await FlutterPhoneDirectCaller.callNumber(contact.phoneNumber!);
            },
            icon: Icon(Icons.phone)),
      ),
    ],
  );
}


/*

() async {
                FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);

*/