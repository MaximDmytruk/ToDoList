import 'package:flutter/material.dart';

import 'designe/colors.dart';

class TaskTextField extends StatelessWidget {
  final TextEditingController textController;

  const TaskTextField({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(top: 44),
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: TextField(
          controller: textController,
          decoration: InputDecoration(
              filled: true,
              hintText: "Enter task",
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                  onPressed: () {
                    textController.clear();
                  },
                  icon: const Icon(Icons.clear))),
        ),
      ),
    );
  }
}
