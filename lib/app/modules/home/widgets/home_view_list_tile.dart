import 'package:flutter/material.dart';

ListTile homeViewListTile({String? title, subtitle}) {
  return ListTile(
    title: Text(title!),
    subtitle: Text(subtitle),
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
