import 'package:flutter/material.dart';

import 'designe/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.title});

  final Text title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      tileColor: itemListcolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: () {},
    );
  }
}
