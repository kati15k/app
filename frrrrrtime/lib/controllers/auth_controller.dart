import 'package:firebase_auth/firebase_auth.dart';
import 'package:frrrrrtime/firebase_ref/references.dart';
import 'package:frrrrrtime/widgets/dialogs/dialogue_widget.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController{
  @override
  void onReady(){
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;

  final _user= Rxn<User>();
  late Stream<User?>_authStateChanges;

  void initAuth() async{
    await Future.delayed(const Duration(seconds: 2));
    _auth=FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value=user;

    });
    navigateToIntroduction();
  }
  sigInWithGoogle() async{
    final GoogleSignIn googleSignIn= GoogleSignIn();
    try{
      GoogleSignInAccount ? account = await googleSignIn.signIn();
      if(account!=null){
        final authAccount= await account.authentication;
        final credentials= GoogleAuthProvider.credential(
          idToken: authAccount.idToken,
          accessToken: authAccount.accessToken,
        );
        await _auth.signInWithCredential(credentials);
        await saveUser(account);
      }


    }on Exception catch (error){
      print(error);
    }
  }
  saveUser(GoogleSignInAccount account){
    userRF.doc(account.email).set({
      "email":account.email,
      "name":account.displayName,
      "profilepic":account.photoUrl
    });
  }
  void navigateToIntroduction(){
    Get.offAllNamed("/introduction");
  }
  void showLoginAlertDialogue(){
    Get.dialog(Dialogs.questionStartDialogue(onTap: (){
      Get.back();


    }),
        barrierDismissible: false
    );
  }

  bool isLoggedIn(){
    return _auth.currentUser!=null;

  }











}