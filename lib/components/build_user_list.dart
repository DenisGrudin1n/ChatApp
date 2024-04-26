import 'package:chatapp/components/user_tile.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:chatapp/views/pages/chat_page.dart';
import 'package:flutter/material.dart';

class BuildUserList extends StatelessWidget {
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  BuildUserList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: chatService.getUsersStream(),
        builder: (context, snapshot) {
          // error
          if (snapshot.hasError) {
            return const Text("Error");
          }

          // loading...
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          // return list view
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                  (userData) => buildUserListItem(userData, context),
                )
                .toList(),
          );
        });
  }

  // build individual list tile for user
  Widget buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != authService.getCurrentUser()!.email) {
      return Column(
        children: [
          UserTile(
            text: userData["email"],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    receiverEmail: userData["email"],
                  ),
                ),
              );
            },
          ),
          Divider(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
