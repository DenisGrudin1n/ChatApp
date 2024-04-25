import 'package:chatapp/constants/constants.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:chatapp/views/pages/login_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(BuildContext context) async {
    final authService = AuthService();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    await authService.signOut();

    if (context.mounted) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: lightBlue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "ChatLite",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.message,
                      size: 30,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
                const Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(),
                        SizedBox(width: 10),
                        Text("Username"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const ListTile(
            title: Text("Account"),
            leading: Icon(Icons.person),
          ),
          const ListTile(
            title: Text("Chats"),
            leading: Icon(Icons.chat),
          ),
          const ListTile(
            title: Text("Notifications"),
            leading: Icon(Icons.notifications),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                title: const Text("Logout"),
                leading: const Icon(Icons.logout),
                onTap: () => logout(context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
