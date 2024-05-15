import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../firebase_ref/references.dart';
class AuthService{
  static const String routeName = "/teacher1";
  static const String RouteName = "/teacher1";
  static const String Routename = "/teacher1";

  static const String routename = "/admin";
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;



  User? getCurrentUser(){
    return _auth.currentUser;
  }


  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      // Sign in with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      // Retrieve user document from Firestore
      DocumentSnapshot userDoc = await _firestore.collection("Users").doc(userCredential.user!.uid).get();
      if (!userDoc.exists) {
        // User document doesn't exist, create it with default fields
        await _firestore.collection("Users").doc(userCredential.user!.uid).set({
          'uid': userCredential.user!.uid,
          'email': email,
          'role': '',

          // Set the initial role to an empty string
        });
      } else {
        // User document exists
        if (userDoc.exists) {
          // Role field exists, print its value
          String role = userDoc['role'];
          if (role == 'teacher') {
            if(email=='yassine@gmail.com'){
              Get.toNamed("/teacher1");
            }
            else if (email=='atibi@gmail.com'){
              Get.toNamed("/teacher2");
            }else if(email=='laarbaoui@gmail.com'){
              Get.toNamed("/teacher3");
            }

          } else {
            // Navigate to the student dashboard if the user is not a teacher
            Get.toNamed("/course");
          }
          print('Role: $role');
        } else {
          // Role field doesn't exist, set it to an empty string
          await _firestore.collection("Users").doc(userCredential.user!.uid).update({'role': ''});
        }
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }





  Future<UserCredential> signUpWithEmailPassword(String email,password ) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
          {
            'uid': userCredential.user!.uid,
            'email':email,
          }
      );

      return userCredential;
    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async{
    return await _auth.signOut();
  }



}