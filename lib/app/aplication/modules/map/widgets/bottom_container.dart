import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  final bool isLoading, isVisible;
  final void Function()? onTap;
  const BottomContainer(
      {super.key, this.isLoading = false, this.isVisible = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.30,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Você gostaria de salvar esse endereço ?',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  saveButton(onTap, isLoading)
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}

Widget saveButton(void Function()? onTap, bool isLoading) {
  return !isLoading
      ? GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Center(
              child: Text(
                'Salvar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      : const Center(
          child: LinearProgressIndicator(
            color: Colors.black,
            backgroundColor: Colors.grey,
            minHeight: 2,
          ),
        );
}
