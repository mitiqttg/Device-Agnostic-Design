import 'package:flutter/material.dart';
import '../widgets/drawer.dart' as prefix;
import '../widgets/footer.dart';
import '../theme/theme_provider.dart';
import 'package:provider/provider.dart';
import '../pages/home.dart';

class Breakpoints {
  static const sm = 640;
  static const md = 768;
  static const lg = 1024;
  static const xl = 1280;
  static const xl2 = 1536;
}

class HowToHelpPage extends StatefulWidget {
  const HowToHelpPage({super.key});

  @override
  State<HowToHelpPage> createState() => _HowToHelpPageState();
}

class _HowToHelpPageState extends State<HowToHelpPage> {
  bool isSwitched = true;

  @override
  void initState() {
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    AppBar appBar() {
      return AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: const Text(
            'Petlastaa',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: isSwitched ? const Color.fromARGB(255, 157, 213, 231) : const Color.fromARGB(255, 98, 208, 228),
        elevation: 10.0,
        centerTitle: true,
        actions: [
          _searchField(),
          Switch(
            thumbIcon: WidgetStateProperty.all(
              isSwitched ? const Icon(Icons.wb_sunny) : const Icon(Icons.nightlight_round),
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
    
    //--------------------------Body of Home----------------------------------
    Column bodyView() {
      // Get screen width for responsive design
      final double screenWidth = MediaQuery.of(context).size.width;
      
      // Determine container sizes based on breakpoints
      double containerWidth = 150;
      double containerHeight = 200;
      bool isRowLayout = screenWidth >= Breakpoints.md;
      
      if (screenWidth >= Breakpoints.lg) {
        containerWidth = 200;
        containerHeight = 250;
      } else if (screenWidth >= Breakpoints.sm) {
        containerWidth = 180;
        containerHeight = 220;
      }

      // Base container widget for reuse
      Widget helpContainer(String title, String imageUrl) {
        return Container(
          width: containerWidth,
          height: containerHeight,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }

      return Column(
        children: [
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 210, 216, 243),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    // Responsive container layout
                    isRowLayout
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              helpContainer(
                                'Donation',
                                'https://images.unsplash.com/photo-1453227588063-f5e0592c7b07',
                              ),
                              helpContainer(
                                'Volunteer',
                                'https://images.unsplash.com/photo-1529390079861-0dd7152e5e9e',
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              helpContainer(
                                'Donation',
                                'https://images.unsplash.com/photo-1453227588063-f5e0592c7b07',
                              ),
                              helpContainer(
                                'Volunteer',
                                'https://images.unsplash.com/photo-1529390079861-0dd7152e5e9e',
                              ),
                            ],
                          ),
                    const SizedBox(height: 20),
                    // Descriptions
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth >= Breakpoints.lg ? 40 : 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Donation',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Your donations help us provide essential resources, medical care, and shelter for pets in need. Every contribution makes a difference in improving their lives.',
                            style: TextStyle(
                              fontSize: screenWidth >= Breakpoints.lg ? 16 : 14,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Volunteer',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Join our team of dedicated volunteers to assist with pet care, event organization, and community outreach. Your time and skills can create lasting impact.',
                            style: TextStyle(
                              fontSize: screenWidth >= Breakpoints.lg ? 16 : 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          const Footer(),
        ],
      );
    }

    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface, 
        appBar: appBar(),
        drawer: const prefix.NavigationDrawer(location: 'Home'),
        body: bodyView(),
      ),
    );
  }
}