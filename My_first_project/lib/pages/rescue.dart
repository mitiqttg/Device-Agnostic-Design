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
             color: const Color(0xff1D1617).withOpacity(0.11),
             color: const Color(0xff1D1617).withValues(),
             blurRadius: 40,
             spreadRadius: 0.0,
           ),
     }
 
     //------------------------------------------------------------Body of Home
     Column bodyView() {
       return Column(
         crossAxisAlignment: CrossAxisAlignment.center,
     GridView bodyView() {
       return GridView.extent(
         maxCrossAxisExtent: 200, 
         shrinkWrap: true,// Maximum width of each grid item
         crossAxisSpacing: 10,
         mainAxisSpacing: 10,
         padding: const EdgeInsets.all(30),
         children: [
           Wrap(
             spacing: 8.0,
             runSpacing: 8.0,
             children: [
               PetCard(
           PetCard(
                 name: 'Gracie',
                 images: ['lib/assets/cat0.png'],
                 shortDes: 'Cute and gracious',
                 specie: 'lib/assets/Icon_cat.png',
                 specie: 'Cat',
                 videos: ['https://youtube.com/watch?v=iq8Mllwz5no'],
                 longDes: 'love you so much',
                 favorites: 'tell you so much',
                 darkMode: isSwitched,
               ),
               SizedBox(height: 8),
               PetCard(
           PetCard(
                 name: 'Thomas',
                 images: ['lib/assets/dog1.png', 'lib/assets/dog3.png', 'lib/assets/dog3.png'],
                 shortDes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna.",
                 specie: 'lib/assets/Icon_dog.png',
                 specie: 'dog',
                 videos: ['https://youtube.com/watch?v=iq8Mllwz5no'],
                 longDes: 'i love you so much ',
                 darkMode: isSwitched,
               ),
               SizedBox(height: 8),
               PetCard(
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
                 favorites: 'cookies and peekaboo',
                 darkMode: isSwitched,
               ),
             ],
           ),
           // -------------------Footer section
           prefix.Footer(),
         ],
       );
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
     }
 
     return MaterialApp(
         backgroundColor: Theme.of(context).colorScheme.surface, 
         appBar: appBar(),
         drawer: const prefix.NavigationDrawer(location: 'Rescue page',),
         body: SingleChildScrollView(
           child: bodyView(),
         )
         body: bodyView(),
       ),
     );
   }