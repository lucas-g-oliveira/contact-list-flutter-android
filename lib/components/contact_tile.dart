// ignore_for_file: prefer_const_constructors

import 'package:contact_list_flutter/models/contact_model.dart';
import 'package:flutter/material.dart';

Widget contactTile(ContactModel contact) {
  return Row(
    children: [
      Image(
        image: AssetImage(contact.imagePath ?? 'images/people1.png'),
        width: 100,
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
        child: IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
      )
    ],
  );
}
