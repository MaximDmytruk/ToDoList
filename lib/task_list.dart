import 'package:flutter/material.dart';
import 'package:todo_list/task_item.dart';

import 'designe/colors.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key, required this.someText});

  final List<String> someText;

  @override
  _TaskList createState() => _TaskList();
}

class _TaskList extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      //ListView;
      child: ListView.separated(
        itemCount: widget.someText.length,
        padding: const EdgeInsets.only(left: 8, right: 8),
        itemBuilder: (BuildContext context, int index) {
          //Dismissible(delete)
          return Dismissible(
            key: Key(widget.someText[index]),
            onDismissed: (side) {
              setState(() {
                widget.someText.removeAt(index);
              });
            },

            //Style of dissible
            background: Container(
              color: dismissibleColor,
              alignment: Alignment.centerRight,
              child: const Icon(Icons.delete, color: iconDeletedColor),
            ),

            //Task Item
            child: TaskItem(
              title: Text(widget.someText[index]),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
