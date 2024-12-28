// import 'package:flutter/material.dart';
import '../widgets/petcard.dart';
// class Rescue extends StatefulWidget {
//   // const Rescue({Key? key}) : super(key: key);
//   const Rescue({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Rescue'),
//       ),
//       body: ListView(
//         children: const <Widget>[
//           PetCard(),
//         ],
//       ),
//     );
//   }
// }

//-----------------------------------------------


import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
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
        title: const Text(
          'Petlastaa',
          style: TextStyle(
            color:  Color.fromARGB(255, 255, 0, 153),
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor:const Color.fromARGB(255, 255, 255, 255),
        elevation: 10.0,
        centerTitle: true,
        actions: [
          _searchField(),
          Switch(
            activeColor: const Color.fromARGB(255, 6, 208, 230),
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
          PetCard(
            name: 'Tom',
            image: 'lib/assets/cat0.png',
            shortDes: 'Cute and gracious',
            specie: 'lib/assets/Icon_cat.png',
            video: '',
            longDes: '',
          ),
          SizedBox(height: 8),
          PetCard(
            name: 'Timmy',
            image: 'lib/assets/dog1.png',
            shortDes: 'Cute and grumpy',
            specie: 'lib/assets/Icon_dog.png',
            video: '',
            longDes: '',
          ),
          SizedBox(height: 8),
          PetCard(
            name: 'Hope',
            image: '../../lib/assets/dog0.png',
            shortDes: 'Dangerous and gracious',
            specie: 'lib/assets/Icon_dog.png',
            video: '',
            longDes: '',
          ),
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
        drawer: const prefix.NavigationDrawer(),
        body: SingleChildScrollView(
          child: bodyView(),
        )
      ),
    );
  }
}
