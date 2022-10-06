import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final void Function()? onTap;

  const TextFieldWidget({super.key, this.onTap, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: onTap,
      decoration: inputDecorator(hintText),
    );
  }
}

// import 'package:flutter/material.dart';

// Widget homeViewTextField({void Function()? onTap}) {
//   return SizedBox(
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 3.0),
//       child: TextField(
//         readOnly: true,
//         onTap: onTap,
//         decoration: inputDecoratorOfTextField(),
//       ),
//     ),
//   );
// }

InputDecoration inputDecorator(String? hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(fontWeight: FontWeight.w500),
    prefixIcon: Icon(
      Icons.search_rounded,
      color: Colors.grey.shade900,
    ),
    fillColor: Colors.white,
    filled: true,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide.none),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide.none),
  );
}
