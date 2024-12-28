import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String name;
  final String image;
  final String shortDes;
  final String specie;
  final String longDes;
  final String video;

  const PetCard(
      {Key? key,
      required this.name,
      required this.image,
      required this.shortDes, 
      required this.specie, 
      required this.longDes, 
      required this.video, 
      }
    ) 
    : super(key: key);
  
  // String icon_specie;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double width = size.width;
    final double height = size.height;

    return Center(
      child: Container(
        width: width / 2,
        height: height / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(222, 168, 209, 249),
        ),
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(26),
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Image(
                  alignment: Alignment.centerLeft,
                  image: AssetImage(image),
                  height: height / 4,
                  width: width / 5,
                  fit: BoxFit.contain,
                ),
                Expanded(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                       "Name: $name",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Specie: $specie",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Description: $shortDes",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),)
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  child: const Text('Adopt'),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('More info'),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
