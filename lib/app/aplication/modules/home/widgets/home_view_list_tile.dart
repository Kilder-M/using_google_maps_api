import 'package:flutter/material.dart';

ListTile homeViewListTile({
  String? title,
}) {
  return ListTile(
    title: Text(title!),
    leading: const CircleAvatar(
      child: Icon(Icons.location_on_outlined),
    ),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Icon(
          Icons.more_horiz,
        ),
      ],
    ),
  );
}
