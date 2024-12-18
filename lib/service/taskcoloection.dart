import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login/model/model_task.dart';

class TodoTaskController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Reactive list of tasks
  var todoTasks = <TodoTask>[].obs;

  // Firestore collection reference for "todoTask"
  CollectionReference get tasksCollection => _firestore.collection('todoTask');
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  // Fetch tasks from Firestore
  Future<void> fetchTasks() async {
    try {
      final snapshot = await tasksCollection.get();
      todoTasks.value = snapshot.docs.map((doc) {
        return TodoTask.fromDocument(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch tasks: $e");
    }
  }

  // Add a new task to Firestore
  Future<void> addTask(TodoTask task) async {
    try {
      final docRef = await tasksCollection.add(task.toDocument());
      task.docId = docRef.id;
      todoTasks.add(task);
    } catch (e) {
      Get.snackbar("Error", "Failed to add task: $e");
    }
  }

  // Update task status in the Firestore and locally
  Future<void> updateTaskStatus(String taskId, bool isChecked) async {
    try {
      await tasksCollection.doc(taskId).update({'isChecked': isChecked});
      // Update the local task list
      final taskIndex = todoTasks.indexWhere((task) => task.docId == taskId);
      if (taskIndex != -1) {
        todoTasks[taskIndex].isChecked = isChecked;
        todoTasks.refresh();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update task status: $e");
    }
  }

  // Future<void> updateTask(TodoTask updatedTask) async {
  //   try {
  //     await tasksCollection
  //         .doc(updatedTask.docId)
  //         .update(updatedTask.toDocument());
  //     int index =
  //         todoTasks.indexWhere((task) => task.docId == updatedTask.docId);
  //     if (index != -1) {
  //       todoTasks[index] = updatedTask;
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", "Failed to update task: $e");
  //   }
  // }

  // Delete a task from Firestore
  Future<void> deleteTask(String docId) async {
    try {
      await tasksCollection.doc(docId).delete();
      todoTasks.removeWhere((task) => task.docId == docId);
    } catch (e) {
      Get.snackbar("Error", "Failed to delete task: $e");
    }
  }
}
