import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/home.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget> [
          // buildHeader(context),
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Center(child: Text('Home'),),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Your account'),
            onTap: () {Get.toNamed('/account');},
          ),
          ListTile(
            leading: const Icon(Icons.pets),
            title: const Text('Rescue'),
            onTap: () {Get.toNamed('/rescue');},
          ),
      ],
    ),
  );
}