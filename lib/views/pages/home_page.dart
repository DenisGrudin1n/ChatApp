import 'package:chatapp/components/build_user_list.dart';
import 'package:chatapp/components/my_drawer.dart';
import 'package:chatapp/components/my_home_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyHomeAppbar(),
      drawer: MyDrawer(),
      body: BuildUserList(),
    );
  }
}
