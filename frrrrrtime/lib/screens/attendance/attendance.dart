import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frrrrrtime/services/auth_service.dart';
import 'package:frrrrrtime/services/chat_service.dart';
class Attendance extends StatefulWidget {
  static const String routeName = "/attendance";

  const Attendance({super.key});

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  final Map<String, bool> _attendanceMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Attendance",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pinkAccent, // Example custom app bar color
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No users available'),
          );
        } else {
          for (var userData in snapshot.data!) {
            _attendanceMap.putIfAbsent(userData['uid'], () => false);
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final userData = snapshot.data![index];
              return _buildUserCard(userData, context);
            },
          );
        }
      },
    );
  }
  Widget _buildUserCard(Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(userData['email']),
            trailing: Checkbox(
              value: _attendanceMap[userData['uid']] ?? false,
              onChanged: (bool? newValue) {
                setState(() {
                  _attendanceMap[userData['uid']] = newValue ?? false;
                });
                _updateAttendance(userData['uid'], newValue!);
              },
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }


  Future<void> _updateAttendance(String uid, bool newValue) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .collection('attendance')
          .doc('attendance')
          .set({
        'present': newValue,
        'timestamp': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (error) {
      print("Error updating attendance: $error");
      rethrow;
    }
  }
}
