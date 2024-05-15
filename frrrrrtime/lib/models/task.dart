import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String? id;
  String? title;
  String? description;
  bool? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  String? color;
  String? repeat;

  Task({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
    this.date,
    this.startTime,
    this.color,
    this.endTime,
    required this.repeat,
  });

  factory Task.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Task(
      id: snapshot.id,
      title: data['title'],
      description: data['description'],
      isCompleted: data['isCompleted'],
      date: data['date'],
      startTime: data['startTime'],
      endTime: data['endTime'],
      color: data['color'],
      repeat: data['repeat'],
    );
  }
}
