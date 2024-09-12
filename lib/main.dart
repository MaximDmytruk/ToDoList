import 'package:flutter/material.dart';
import 'package:todo_list/data_base/data_base.dart';

import 'designe/colors.dart';
import 'save_task_button.dart';
import 'task_list.dart';
import 'task_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

//HomePage
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //DataBase
  DataBase tasksDataBase = DataBase();
  //Text Controller
  final textController = TextEditingController();
  //Active bool button
  bool isButtonDisabled = true;

  //Restart Widget and textField observer
  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      setState(() {
        isButtonDisabled = textController.text.isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      //AppBar
      appBar: AppBar(
        title: const Text(
          'ToDo list',
          style: TextStyle(
              color: appBarFontColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: appBarBackgroundColor,
        centerTitle: true,
      ),

      //Body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            addTextField(textController),
            addSaveTaskButton(textController, tasksDataBase, isButtonDisabled),
            addTaskList(tasksDataBase.getListOfTask()),
          ],
        ),
      ),
    );
  }
}

Widget addTextField(TextEditingController contr) {
  return TaskTextField(textController: contr);
}

Widget addSaveTaskButton(
    TextEditingController control, DataBase dataBase, bool isDisabled) {
  return SaveTaskButton(
    textController: control,
    dataBase: dataBase,
    isButtonDisabled: isDisabled,
  );
}

Widget addTaskList(List<String> tasksList) {
  return TaskList(someText: tasksList);
}
