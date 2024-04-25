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
        children: [
          SizedBox(
            height: 150,
            width: 320,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: lightBlue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: CircleAvatar(
                      radius: 27.5,
                      backgroundImage: NetworkImage(
                          'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png?f=webp'),
                    ),
                  ),
                  const SizedBox(height: 7.5),
                  Text(
                    "Username",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: mediumFontWeight,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          const ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
          ),
          const ListTile(
            title: Text(
              "Settings",
            ),
            leading: Icon(
              Icons.settings,
            ),
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
