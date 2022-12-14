import 'package:flutter/material.dart';

Widget homeViewTextField({void Function()? onTap}) {
  return SizedBox(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: TextField(
        readOnly: true,
        onTap: onTap,
        decoration: inputDecoratorOfTextField(),
      ),
    ),
  );
}

InputDecoration inputDecoratorOfTextField() {
  return InputDecoration(
    hintText: 'Pesquisar um novo endereço...',
    hintStyle: const TextStyle(fontWeight: FontWeight.w500),
    suffixIcon: Icon(
      Icons.search_rounded,
      color: Colors.grey.shade900,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: const BorderSide(
        width: 0.5,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
  );
}
