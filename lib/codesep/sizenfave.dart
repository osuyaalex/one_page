import 'package:flutter/material.dart';

Widget SizeAndFave(String text){
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      key: Key('1'),
      child: Text(text,

        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}