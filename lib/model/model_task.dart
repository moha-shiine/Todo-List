class TodoTask {
  String docId; // Firestore document ID
  final String titleTask;
  final String description;
  final String categoryTask;
  final String dateTask;
  final String timeTask;

  TodoTask({
    required this.docId,
    required this.titleTask,
    required this.description,
    required this.categoryTask,
    required this.dateTask,
    required this.timeTask,
  });

  // Factory constructor to create a TodoTask from Firestore document
  factory TodoTask.fromDocument(Map<String, dynamic> doc, String docId) {
    return TodoTask(
      docId: docId,
      titleTask: doc['titleTask'],
      description: doc['description'],
      categoryTask: doc['categoryTask'],
      dateTask: doc['dateTask'],
      timeTask: doc['timeTask'],
    );
  }

  // Convert TodoTask to a Firestore-compatible map
  Map<String, dynamic> toDocument() {
    return {
      'titleTask': titleTask,
      'description': description,
      'categoryTask': categoryTask,
      'dateTask': dateTask,
      'timeTask': timeTask,
    };
  }
}
