import 'package:flutter/cupertino.dart';

Widget homeViewTitle() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(12, 20, 0, 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          'Meus Endereços',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
