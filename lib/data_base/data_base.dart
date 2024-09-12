class DataBase {
  List<String> listOfTasks = [];

  setInListOfTask(String tasks) {
    listOfTasks.add(tasks);
  }

  getListOfTask() => listOfTasks;
}
