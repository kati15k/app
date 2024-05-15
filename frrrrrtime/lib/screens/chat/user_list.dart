import 'package:flutter/material.dart';
import 'package:frrrrrtime/screens/chat/chat_page.dart';
import '../../services/auth_service.dart';

class UserListItem extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
  final AuthService _authService = AuthService();

   UserListItem({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _shouldDisplayUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!) {
          // Display the user list item
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      receiverEmail: receiverEmail,
                      receiverID: receiverID,
                    ),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundColor: _generateRandomColor(),
                child: Text(
                  receiverEmail.substring(0, 1).toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(receiverEmail),
              subtitle: const Text('Online'), // Example status indicator
            ),
          );
        } else {
          // Don't display the user list item
          return const SizedBox.shrink();
        }
      },
    );
  }

  Future<bool> _shouldDisplayUser() async {
    final currentUserEmail = _authService.getCurrentUser()?.email;
    return currentUserEmail != receiverEmail;
  }

  Color _generateRandomColor() {
    final List<Color> color = [
      Colors.blue.withOpacity(0.7),
    ];
    // Use hashCode of receiverEmail to determine color index
    return color[receiverEmail.hashCode % color.length];
  }
}
/* Container(
          child: BackgoundDecoration(
            child: InkWell(
              child: _buildUserList(context),
            ),
          ),
        ),
      ),
    );
  }*/