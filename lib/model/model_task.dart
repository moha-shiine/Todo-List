class TodoTask {
  String Docid;
  final String titleTask;
  final String description;
  final String categoryTask;
  final String dateTask;
  final String timeTask;
  TodoTask(this.Docid,
      {required this.titleTask,
      required this.description,
      required this.categoryTask,
      required this.dateTask,
      required this.timeTask});
}
