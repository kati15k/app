import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frrrrrtime/models/task.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  final CollectionReference _tasksRef =
  FirebaseFirestore.instance.collection("tasks");
  RxList<Task> taskList = <Task>[].obs;

  Stream<List<Task>> displayAllTasks() {
    return _tasksRef.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Task.fromDocumentSnapshot(doc))
          .toList();
    });
  }

  Future<void> deleteTask(Task task) async {
    await _tasksRef.doc(task.id.toString()).delete();
  }


  Future<void> markTaskCompleted(String taskId) async {
    await _tasksRef.doc(taskId).update({'isCompleted': 1});
  }
}
