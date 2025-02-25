import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../pages/rescue.dart';
import '../pages/donation.dart';

class NavigationDrawer extends StatefulWidget {
  final String location;
  const NavigationDrawer({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  void initState() {
    super.initState();}
  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget> [
          // buildHeader(context),
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 205, 243, 253),
            ),
            child: Center(child: Text(widget.location),),
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
            leading: const Icon(Icons.handshake),
            title: const Text('Donation'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DonationPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.pets),
            title: const Text('Rescue'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RescuePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.handyman),
            title: const Text('Need a help'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RescuePage()),
              );
            },
          ),
      ],
    ),
  );}
}