import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:frrrrrtime/screens/chat/user_list.dart';
import 'package:frrrrrtime/services/chat_service.dart';
import 'package:get/get.dart';
import '../../configs/themes/app_colors.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../widgets/app_circle_button.dart';
import '../../widgets/app_icons.dart';
import '../home/menu_screen.dart';

class ChatScreen extends GetView<MyZoomDrawerController> {
  static const String routeName = "/chat";

   ChatScreen({super.key});

  final ChatService _chatService = ChatService();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(
        builder: (_) {
          return ZoomDrawer(
            borderRadius: 50.0,
            controller: _.zoomDrawerController,
            showShadow: true,
            angle: 0.0,
            style: DrawerStyle.DefaultStyle,
            backgroundColor: Colors.white.withOpacity(0.5),
            slideWidth: MediaQuery.of(context).size.width * 0.5,
            menuScreen: const MenuScreen(),
            mainScreen: Container(
              decoration: BoxDecoration(
                gradient: mainGradient(),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(mobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AppCircleButton(
                                onTap: controller.toogleDraw,
                                width: 10,
                                child: const Icon(AppIcons.menuleft),
                              ),
                              const SizedBox(width: 15),
                              const Text(
                                "Available Users",
                                style: headerText,
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          _buildSearchBar(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: _buildUserList(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.white),
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Search...",
            hintStyle: TextStyle(color: Colors.white60),
            prefixIcon: Icon(Icons.search, color: Colors.white70),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            // Implement search functionality here
          },
        ),
      ),
    );
  }

  Widget _buildUserList(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
          return const Center(child: Text('No users available'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final userData = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: UserListItem(
                  receiverEmail: userData["email"],
                  receiverID: userData["uid"],
                  // Add illustration or avatar here if available
                  // Add status indicator here if available
                ),
              );
            },
          );
        }
      },
    );
  }
}

/*Widget _buildUserCard(Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      bool isPresent = false;
      return Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
    }*/