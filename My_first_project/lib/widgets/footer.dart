import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
            // color: Theme.of(context).colorScheme.primary,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            // color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget> [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 45.0,
                            width: 45.0,
                            child: Center(
                              child:  Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.audiotrack,size: 20.0,),
                                  color: const Color.fromARGB(255, 255, 0, 153),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 45.0,
                            width: 45.0,
                            child: Center(
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.fingerprint,size: 20.0,),
                                  color: const Color.fromARGB(255, 255, 0, 153),
                                  onPressed: () {},
                                ),
                              ),
                            )
                          ),
                          SizedBox(
                            height: 45.0,
                            width: 45.0,
                            child: Center(
                              child:Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0), // half of height and width of Image
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.call,size: 20.0,),
                                  color: const Color.fromARGB(255, 255, 0, 153),
                                  onPressed: () {},
                                ),
                              ),
                            )
                          ),
                        ]
                      ),),
                      const Text('Copyright ©2024, All Rights Reserved.',style: TextStyle(fontWeight:FontWeight.w300, fontSize: 12.0, color: Color.fromARGB(255, 255, 0, 153)),),
                      const Text('Made by Tien Tran',style: TextStyle(fontWeight:FontWeight.w300, fontSize: 12.0,color: Color.fromARGB(255, 255, 0, 153)),),
                    ]
                  ),    
                )
              ]
            )
          ),
    );
  }

}



