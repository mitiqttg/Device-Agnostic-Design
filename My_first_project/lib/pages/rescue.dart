import '../pages/home.dart';

import '../widgets/petcard.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer.dart' as prefix;
import '../widgets/footer.dart' as prefix;
import '../theme/theme_provider.dart';
import 'package:provider/provider.dart';


class RescuePage extends StatefulWidget {
  const RescuePage({super.key});

  @override
  State<RescuePage> createState() => _RescueState();
}

class _RescueState extends State<RescuePage> {
  bool isSwitched = true;

  //-----------------------------------Search box---------------------------------
  Container _searchField() {
    double appBarHeight = AppBar().preferredSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: appBarHeight / 2, 
      width: appBarHeight * 4 ,

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withValues(),
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
              color: Colors.white, // Customize the text color
              fontWeight: FontWeight.bold, // Customize the font weight
            ),
          ),
        ),
        backgroundColor: isSwitched ? const Color.fromARGB(222, 205, 226, 248) : const Color.fromARGB(255, 98, 208, 228),
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
    GridView bodyView() {
      return GridView.extent(
        maxCrossAxisExtent: 200, 
        shrinkWrap: true,// Maximum width of each grid item
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(30),
        children: [
          PetCard(
<<<<<<< HEAD
            name: 'Gracie',
            images: ['lib/assets/cat0.png'],
            shortDes: 'Cute and gracious',
            specie: 'lib/assets/Icon_cat.png',
            videos: ['https://youtube.com/watch?v=iq8Mllwz5no'],
            longDes: 'dklhdalffa dajfal so much',
            favorites: 'tell you so much',
            darkMode: isSwitched,
          ),
          SizedBox(height: 8),
          PetCard(
            name: 'Thomas',
            images: ['lib/assets/dog1.png', 'lib/assets/dog3.png', 'lib/assets/dog3.png'],
            shortDes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna.",
            specie: 'lib/assets/Icon_dog.png',
            videos: ['https://youtube.com/watch?v=iq8Mllwz5no'],
            longDes: 'idsdsddccccc so smbbbbaaaaaa ',
            darkMode: isSwitched,
          ),
          SizedBox(height: 8),
          PetCard(
            name: 'Hope',
            images: ['../../lib/assets/dog4.png', 'lib/assets/dog1.png',],
            shortDes: 'Dangerous and gracious',
            specie: 'lib/assets/Icon_dog.png',
            videos: ['https://youtube.com/watch?v=iq8Mllwz5no', 'https://youtube.com/watch?v=iq8Mllwz5no'],
            longDes: 'asdu sajdhd jsadhajdhhhhsahdai asidddddddd',
            birth: '2021-09-01',
            favorites: 'asocnajiqbw wdqbqffq',
            darkMode: isSwitched,
          ),
          // -------------------Footer section
          prefix.Footer(),
        ],
      );
=======
                name: 'Gracie',
                images: ['lib/assets/cat0.png'],
                shortDes: 'Cute and gracious',
                specie: 'Cat',
                videos: ['https://youtube.com/watch?v=iq8Mllwz5no'],
                longDes: 'love you so much',
                favorites: 'tell you so much',
                darkMode: isSwitched,
              ),
          PetCard(
                name: 'Thomas',
                images: ['lib/assets/dog1.png', 'lib/assets/dog3.png', 'lib/assets/dog3.png'],
                shortDes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna.",
                specie: 'dog',
                videos: ['https://youtube.com/watch?v=iq8Mllwz5no'],
                longDes: 'i love you so much ',
                darkMode: isSwitched,
              ),
          PetCard(
                name: 'Hope',
                images: ['../../lib/assets/dog4.png', 'lib/assets/dog1.png',],
                shortDes: 'Dangerous and gracious',
                specie: 'dog',
                videos: ['https://youtube.com/watch?v=iq8Mllwz5no', 'https://youtube.com/watch?v=iq8Mllwz5no'],
                longDes: 'i love you so much i hope you well and all the best from the bottom of my heart',
                birth: '2021-09-01',
                favorites: 'cookies and peekaboo',
                darkMode: isSwitched,
              ),
          PetCard(
                name: 'Hope',
                images: ['../../lib/assets/dog4.png', 'lib/assets/dog1.png',],
                shortDes: 'Dangerous and gracious',
                specie: 'dog',
                videos: ['https://youtube.com/watch?v=iq8Mllwz5no', 'https://youtube.com/watch?v=iq8Mllwz5no'],
                longDes: 'i love you so much i hope you well and all the best from the bottom of my heart',
                birth: '2021-09-01',
                favorites: 'cookies and peekaboo',
                darkMode: isSwitched,
              ),
          PetCard(
                name: 'Hope',
                images: ['../../lib/assets/dog4.png', 'lib/assets/dog1.png',],
                shortDes: 'Dangerous and gracious',
                specie: 'lib/assets/Icon_dog.png',
                videos: ['https://youtube.com/watch?v=iq8Mllwz5no', 'https://youtube.com/watch?v=iq8Mllwz5no'],
                longDes: 'i love you so much i hope you well and all the best from the bottom of my heart',
                birth: '2021-09-01',
                favorites: 'cookies and peekaboo',
                darkMode: isSwitched,
              ),
          PetCard(
                name: 'Hope',
                images: ['../../lib/assets/dog4.png', 'lib/assets/dog1.png',],
                shortDes: 'Dangerous and gracious',
                specie: 'lib/assets/Icon_dog.png',
                videos: ['https://youtube.com/watch?v=iq8Mllwz5no', 'https://youtube.com/watch?v=iq8Mllwz5no'],
                longDes: 'i love you so much i hope you well and all the best from the bottom of my heart',
                birth: '2021-09-01',
                favorites: 'cookies and peekaboo',
                darkMode: isSwitched,
              ),
          PetCard(
                name: 'Hope',
                images: ['../../lib/assets/dog4.png', 'lib/assets/dog1.png',],
                shortDes: 'Dangerous and gracious',
                specie: 'lib/assets/Icon_dog.png',
                videos: ['https://youtube.com/watch?v=iq8Mllwz5no', 'https://youtube.com/watch?v=iq8Mllwz5no'],
                longDes: 'i love you so much i hope you well and all the best from the bottom of my heart',
                birth: '2021-09-01',
                favorites: 'cookies and peekaboo',
                darkMode: isSwitched,
              ),
          PetCard(
                name: 'Hope',
                images: ['../../lib/assets/dog4.png', 'lib/assets/dog1.png',],
                shortDes: 'Dangerous and gracious',
                specie: 'lib/assets/Icon_dog.png',
                videos: ['https://youtube.com/watch?v=iq8Mllwz5no', 'https://youtube.com/watch?v=iq8Mllwz5no'],
                longDes: 'i love you so much i hope you well and all the best from the bottom of my heart',
                birth: '2021-09-01',
                favorites: 'cookies and peekaboo',
                darkMode: isSwitched,
              ),
          PetCard(
                name: 'Hope',
                images: ['../../lib/assets/dog4.png', 'lib/assets/dog1.png',],
                shortDes: 'Dangerous and gracious',
                specie: 'lib/assets/Icon_dog.png',
                videos: ['https://youtube.com/watch?v=iq8Mllwz5no', 'https://youtube.com/watch?v=iq8Mllwz5no'],
                longDes: 'i love you so much i hope you well and all the best from the bottom of my heart',
                birth: '2021-09-01',
                favorites: 'cookies and peekaboo',
                darkMode: isSwitched,
              ),
          PetCard(
                name: 'Hope',
                images: ['../../lib/assets/dog4.png', 'lib/assets/dog1.png',],
                shortDes: 'Dangerous and gracious',
                specie: 'lib/assets/Icon_dog.png',
                videos: ['https://youtube.com/watch?v=iq8Mllwz5no', 'https://youtube.com/watch?v=iq8Mllwz5no'],
                longDes: 'i love you so much i hope you well and all the best from the bottom of my heart',
                birth: '2021-09-01',
                favorites: 'cookies and peekaboo',
                darkMode: isSwitched,
              ),
          PetCard(
                name: 'Hope',
                images: ['../../lib/assets/dog4.png', 'lib/assets/dog1.png',],
                shortDes: 'Dangerous and gracious',
                specie: 'lib/assets/Icon_dog.png',
                videos: ['https://youtube.com/watch?v=iq8Mllwz5no', 'https://youtube.com/watch?v=iq8Mllwz5no'],
                longDes: 'i love you so much i hope you well and all the best from the bottom of my heart',
                birth: '2021-09-01',
                favorites: 'cookies and peekaboo',
                darkMode: isSwitched,
              ),
          PetCard(
                name: 'Hope',
                images: ['../../lib/assets/dog4.png', 'lib/assets/dog1.png',],
                shortDes: 'Dangerous and gracious',
                specie: 'lib/assets/Icon_dog.png',
                videos: ['https://youtube.com/watch?v=iq8Mllwz5no', 'https://youtube.com/watch?v=iq8Mllwz5no'],
                longDes: 'i love you so much i hope you well and all the best from the bottom of my heart',
                birth: '2021-09-01',
                favorites: 'cookies and peekaboo',
                darkMode: isSwitched,
              ),

        ]
        
        );

// Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Wrap(
//             spacing: 8.0,
//             runSpacing: 8.0,
//             children: [
//               PetCard(
//                 name: 'Gracie',
//                 images: ['lib/assets/cat0.png'],
//                 shortDes: 'Cute and gracious',
//                 specie: 'lib/assets/Icon_cat.png',
//                 videos: ['https://youtube.com/watch?v=iq8Mllwz5no'],
//                 longDes: 'love you so much',
//                 favorites: 'tell you so much',
//                 darkMode: isSwitched,
//               ),
//               SizedBox(height: 8),
//               PetCard(
//                 name: 'Thomas',
//                 images: ['lib/assets/dog1.png', 'lib/assets/dog3.png', 'lib/assets/dog3.png'],
//                 shortDes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna.",
//                 specie: 'lib/assets/Icon_dog.png',
//                 videos: ['https://youtube.com/watch?v=iq8Mllwz5no'],
//                 longDes: 'i love you so much ',
//                 darkMode: isSwitched,
//               ),
//               SizedBox(height: 8),
//               PetCard(
//                 name: 'Hope',
//                 images: ['../../lib/assets/dog4.png', 'lib/assets/dog1.png',],
//                 shortDes: 'Dangerous and gracious',
//                 specie: 'lib/assets/Icon_dog.png',
//                 videos: ['https://youtube.com/watch?v=iq8Mllwz5no', 'https://youtube.com/watch?v=iq8Mllwz5no'],
//                 longDes: 'i love you so much i hope you well and all the best from the bottom of my heart',
//                 birth: '2021-09-01',
//                 favorites: 'cookies and peekaboo',
//                 darkMode: isSwitched,
//               ),
//             ],
//           ),
//           // -------------------Footer section
//           prefix.Footer(),
//         ],
//       );
>>>>>>> dc58ec9237ba6b6e3df5088602649d5e094d2bfc
    }

    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface, 
        appBar: appBar(),
        drawer: const prefix.NavigationDrawer(location: 'Rescue page',),
        body: bodyView(),
      ),
    );
  }
}
