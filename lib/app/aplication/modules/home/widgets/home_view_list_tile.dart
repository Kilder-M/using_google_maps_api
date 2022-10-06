import 'package:flutter/material.dart';

ListTile homeViewListTile({
  String? title,
  void Function()? onTap,
}) {
  return ListTile(
    title: Text(title!),
    leading: const CircleAvatar(
      child: Icon(Icons.location_on_outlined),
    ),
    trailing: GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Icon(
            Icons.more_horiz,
          ),
        ],
      ),
    ),
  );
}
