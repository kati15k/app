import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frrrrrtime/models/message.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  Future<void> sendMessages(String receiverID, String message) async {
    try {
      final String currentUserId = _auth.currentUser!.uid;
      final String currentUserEmail = _auth.currentUser!.email!;
      final Timestamp timestamp = Timestamp.now();

      Message newMessage = Message(
        senderID: currentUserId,
        senderEmail: currentUserEmail,
        message: message,
        timestamp: timestamp,
        receiverID: receiverID,
      );

      List<String> ids = [currentUserId, receiverID];
      ids.sort();
      String chatRoomID = ids.join('_');

      await _firestore
          .collection("chat_rooms")
          .doc(chatRoomID)
          .collection("messages")
          .add(newMessage.toMap());
    } catch (e) {
      print('Error sending message: $e');
      rethrow; // Rethrow the error for handling in UI if necessary
    }
  }

  Stream<QuerySnapshot> getMessages(String userID, String otherUserID) {
    try {
      List<String> ids = [userID, otherUserID];
      ids.sort();
      String chatRoomID = ids.join('_');

      return _firestore
          .collection("chat_rooms")
          .doc(chatRoomID)
          .collection("messages")
          .orderBy("timestamp", descending: false)
          .snapshots();
    } catch (e) {
      print('Error fetching messages: $e');
      rethrow; // Rethrow the error for handling in UI if necessary
    }
  }

  Future<void> updateAttendance(bool isPresent) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        String uid = user.uid;
        await FirebaseFirestore.instance
            .collection('Users') // Access the top-level collection
            .doc(uid) // Use the user's UID as the document ID
            .collection('attendance') // Access the "attendance" subcollection
            .doc('attendance') // Access a specific document within the subcollection (if needed)
            .set({
          'present': isPresent,
          'timestamp': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true)); // Merge to update only present field
      } else {
        print('No user signed in');
      }
    } catch (error) {
      print("Error updating attendance: $error");
      rethrow; // Rethrow the error for handling in UI if necessary
    }
  }

}
