import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frrrrrtime/configs/themes/app_colors.dart';
import 'package:frrrrrtime/widgets/common/login_button.dart';
import 'package:get/get.dart';
import '../../services/auth_service.dart';
import '../../widgets/common/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(), // Assuming mainGradient() returns your existing gradient
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  size: 60,
                  color: Colors.white,
                ),
                Text("Univers School",
                    style: TextStyle(
                      fontSize: 20,
                      color: onSurfaceTextColor,
                    )),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: MyTextField(
                    myColor: Colors.white,
                    obscureText: false,
                    hintText: 'Enter Email',
               textcontroller: _emailController,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: MyTextField(
                    myColor: Colors.white,
                    obscureText: true,
                    hintText: 'Enter Password',
                textcontroller: _passwordController,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: LoginButton(
                    onTap: () async {
                      // Your existing onTap logic
                    },
                    text: "Login",

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Your existing login function
}

