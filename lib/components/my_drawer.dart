import 'package:chatapp/constants/constants.dart';
import 'package:chatapp/controllers/theme_controller.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/themes/themes.dart';
import 'package:chatapp/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  final AuthService authService = AuthService();

  MyDrawer({super.key});

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
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          radius: 27.5,
                          backgroundImage: NetworkImage(
                              'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png?f=webp'),
                        ),
                        IconButton(
                          onPressed: () => Provider.of<ThemeController>(context,
                                  listen: false)
                              .toggleTheme(),
                          icon: Icon(
                            Provider.of<ThemeController>(context).themeData ==
                                    lightMode
                                ? Icons.dark_mode
                                : Icons.light_mode,
                            size: 25,
                            color: kWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7.5),
                  Text(
                    "${authService.getCurrentUser()!.email}",
                    style: const TextStyle(
                        color: kWhite,
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
