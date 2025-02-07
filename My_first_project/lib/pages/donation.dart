import 'package:flutter/material.dart';
import '../widgets/drawer.dart' as prefix;
import '../widgets/footer.dart' as prefix;
import '../theme/theme_provider.dart';
import 'package:provider/provider.dart';


class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationState();
}

class _DonationState extends State<DonationPage> {
  bool isSwitched = true;

  //------------------------------------------------------------Search box
  Container _searchField() {
    double appBarHeight = AppBar().preferredSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: appBarHeight / 2, 
      width: appBarHeight * 4 ,

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 10.0),
            ),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            leading: const Icon(Icons.search),
          );
        },
        suggestionsBuilder: (BuildContext context, SearchController controller) {
          return List<ListTile>.generate(5, (int index) {
            final String item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () {},
            );
          });
        },
      ),
    );
  }

  //------------------------------------------------------------App bar
  @override
  Widget build(BuildContext context) {
    AppBar appBar() {
      return AppBar(
        title: Text(
          'Petlastaa',
          style: TextStyle(
            color: isSwitched ? const Color.fromARGB(255, 255, 0, 153) : Color.fromARGB(255, 241, 119, 212),
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: isSwitched ? const Color.fromARGB(255, 157, 213, 231) : const Color.fromARGB(255, 98, 208, 228),
        elevation: 10.0,
        centerTitle: true,
        actions: [
          _searchField(),
          Switch(
            thumbIcon: WidgetStateProperty.all(
              isSwitched ? const Icon(Icons. wb_sunny) : const Icon(Icons.  nightlight_round),
            ),
            focusColor: const Color.fromARGB(255, 175, 214, 238),
            activeColor: const Color.fromARGB(255, 68, 172, 241),
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = !isSwitched;
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              });  
            },
          ),
          const BackButton(),
        ],
      );
    }
    
    //------------------------------------------------------------Body of Home
    Column bodyView() {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // -------------------Footer section
          prefix.Footer(),
        ],
      );
    }

    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface, 
        appBar: appBar(),
        drawer: const prefix.NavigationDrawer(location: 'Donation',),
        body: SingleChildScrollView(
          child: bodyView(),
        )
      ),
    );
  }
}
