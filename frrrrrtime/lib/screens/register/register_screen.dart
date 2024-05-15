import 'package:flutter/material.dart';
import 'package:frrrrrtime/services/auth_service.dart';
import 'package:get/get.dart';

import '../../configs/themes_secondary/light_mode.dart';
import '../../widgets/common/app_text_field.dart';
import '../../widgets/common/login_button.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmcontroller = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: lightMode.colorScheme.primary,
            ),
            const SizedBox(
              height: 40,
            ),
            MyTextField(
              myColor: Colors.white,
              obscureText: false,
              textcontroller: _emailcontroller,
              hintText: 'Enter Email',
            ),
            const SizedBox(height: 10),
            MyTextField(
              myColor: Colors.white,
              textcontroller: _passwordcontroller,
              obscureText: true,
              hintText: 'Enter Password',
            ),
            MyTextField(
              myColor: Colors.white,
              textcontroller: _confirmcontroller,
              obscureText: true,
              hintText: 'Confirm Password',
            ),
            const SizedBox(height: 10),
            Center(
              child: LoginButton(
                onTap: () async {
                  try {
                    await register(context);
                    // Navigate to the login screen only if registration is successful
                    Get.toNamed("/login");
                  } catch (e) {
                    // Do nothing here because the error handling is already done in the register method
                  }
                },

                text: "Register ",
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: lightMode.colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/login");
                  },
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      color: lightMode.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> register(BuildContext context) async {
    final auth = AuthService();
    if (_passwordcontroller.text == _confirmcontroller.text) {
      try {
        // Use the appropriate registration method from your AuthService
        await auth.signInWithEmailPassword(
            _emailcontroller.text, _passwordcontroller.text);
        // Registration successful
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
        // Registration failed, throw an error to indicate failure
        throw Exception("Registration failed");
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
      // Registration failed due to password mismatch
      throw Exception("Passwords don't match");
    }

}

}
