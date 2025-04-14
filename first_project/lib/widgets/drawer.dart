import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../pages/rescue.dart';
import '../pages/donation.dart';
import '../pages/volunteer.dart';
import '../pages/helphow.dart' as how;

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
    children: <Widget>[
      DrawerHeader(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 205, 243, 253),
        ),
        child: Center(child: Text(widget.location)),
      ),
      
      // Home (main item)
      ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text('Home', style: TextStyle(fontSize: 16)), // Default size
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()))
      ),
      
      // Rescue (main item)
      ListTile(
        leading: const Icon(Icons.pets),
        title: const Text('Rescue', style: TextStyle(fontSize: 16)),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RescuePage())),
      ),

      ListTile(
        leading: const Icon(Icons.arrow_circle_right),
        title: const Text('Rehome', style: TextStyle(fontSize: 16)),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RescuePage())),
      ),
      
            // Section header (same size as Home)
      ListTile(
        leading: const Icon(Icons.handshake, size: 20),
        title: Text('How you can help'),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const how.HowToHelpPage()))
      ),

      // Donation (sub-item)
      ListTile(
        leading: const Icon(Icons.handshake, size: 20), // Slightly smaller icon
        title: const Text('Donation', style: TextStyle(fontSize: 14)), // Smaller text
        contentPadding: const EdgeInsets.only(left: 40), // Indent more than main items
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DonationPage())),
      ),
      
      // Volunteering (sub-item)
      ListTile(
        leading: const Icon(Icons.people_alt, size: 20),
        title: const Text('Volunteering', style: TextStyle(fontSize: 14)),
        contentPadding: const EdgeInsets.only(left: 40),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const VolunteeringPage())),
      ),
      
    ],
  ),
);
  }
}