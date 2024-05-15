import 'package:flutter/material.dart';
import 'package:frrrrrtime/configs/themes/app_colors.dart';
import 'package:frrrrrtime/configs/themes/ui_parameters.dart';
import 'package:frrrrrtime/controllers/zoom_drawer_controller.dart';
import 'package:get/get.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({super.key});
  static const String routeName = "/task";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: mainGradient(),
      ),
      child: Container(
        padding: UIParameters.mobileScreenPadding,
        width: double.maxFinite,
        child: Theme(
          data: ThemeData(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: onSurfaceTextColor),
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: BackButton(
                    color: Colors.white,
                    onPressed: () {
                      controller.toogleDraw();
                    },
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      child: Text(
                        "Navigation Bar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
                    _DrawerButton(
                      icon: Icons.chat,
                      label: "Chat",
                      onPressed: () => Get.toNamed("/task"),
                    ),
                    _DrawerButton(
                      icon: Icons.facebook,
                      label: "Facebook",
                      onPressed: () => controller.page1(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: _DrawerButton(
                        icon: Icons.email,
                        label: "Email",
                        onPressed: () => controller.page1(),
                      ),
                    ),
                    const Spacer(flex: 4),
                    _DrawerButton(
                      icon: Icons.logout,
                      label: "Logout",
                      onPressed: () => controller.page1(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({
    required this.icon,
    required this.label,
    this.onPressed,
  });
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 15,
      ),
      label: Text(label),
    );
  }
}
