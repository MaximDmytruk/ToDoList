import 'package:flutter/material.dart';
import 'package:todo_list/data_base/data_base.dart';

class SaveTaskButton extends StatelessWidget {
  const SaveTaskButton({
    super.key,
    required this.textController,
    required this.dataBase,
    required this.isButtonDisabled,
  });

  final DataBase dataBase;
  final TextEditingController textController;
  final bool isButtonDisabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isButtonDisabled
          ? null
          : () {
              dataBase.setInListOfTask(textController.text);
              textController.clear();
            },
      child: const Text('Save'),
    );
  }
}
