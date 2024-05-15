import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:frrrrrtime/configs/themes_third/theme.dart';
import 'package:frrrrrtime/widgets/task_widgets/button_task.dart'; // Import the MyButton widget
import 'package:frrrrrtime/widgets/task_widgets/input_field_task.dart';
import '../../controllers/tasks/task_controller.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController= Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedColor = 0;
  final CollectionReference _tasksRef =
  FirebaseFirestore.instance.collection('tasks');



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Event", style: headingStyle),
              MyInputfield(title: "Title", hint: "Enter your title", controller: _titleController,),
              MyInputfield(
                title: "Event Description",
                hint: "Enter your Description",controller: _noteController,
              ),
              MyInputfield(
                title: "Date",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: const Icon(Icons.calendar_today_outlined, color: Colors.grey),
                  onPressed: () {
                    _getDateFromUser(context); // Pass the context here
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputfield(
                      title: "Start Date",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: MyInputfield(
                      title: "End Date",
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () { _getTimeFromUser(isStartTime: false);},
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Add spacing between the rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorPalette(),
                  MyButton(label: "Create Event", onTap: _addTaskToDb)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _colorPalette() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        Wrap(
          children: List<Widget>.generate(3, (int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                  print("$index");
                });
              },

             /* child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0 ? pinkiehh : index == 1 ? bluehh : orangehh,
                  child: _selectedColor == index ? const Icon(Icons.done, color: Colors.white,size:16) : null,
                ),
              ),*/

            );
          }),
        ),
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const SizedBox.shrink(),
      backgroundColor: Theme.of(context).colorScheme.background,
      leading: GestureDetector(
        onTap: () {},
        child: const Icon(
          Icons.nightlight_round,
          size: 16,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.person, size: 20),
          onPressed: () {},
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  void _addTaskToDb() async {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      await _tasksRef.add({
        'title': _titleController.text,
        'description': _noteController.text,
        'date': DateFormat.yMd().format(_selectedDate),
        'startTime': _startTime,
        'endTime': _endTime,
        'color': _selectedColor.toString(),
      });
      print('Adding task to database...');
      print('Title: ${_titleController.text}');
      print('Description: ${_noteController.text}');
      print('Selected Date: $_selectedDate');
      print('Start Time: $_startTime');
      print('End Time: $_endTime');
      print('Selected Color: $_selectedColor');
    } else {
      Get.snackbar(
        "Required",
        "All fields are required !",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blueGrey,
        icon: const Icon(Icons.warning_amber_rounded),

      );return;
    }
        await Get.to(() => const AddTaskPage());
  }

  _getDateFromUser(BuildContext context) async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2124),
    );

    if (pickerDate != null) {
      setState(() {
        _selectedDate = pickerDate;
        print(_selectedDate);
      });
    } else {
      print("it's null or something is wrong");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formattedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time canceled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = formattedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = formattedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]),
        minute: int.parse(_startTime.split(":")[1].split("")[0]),
      ),
    );
  }
}

