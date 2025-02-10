import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:video_player/video_player.dart';
import 'videoPlayer.dart';
// import 'package:flutter_carousel_media_slider/flutter_carousel_media_slider.dart';
import '../pages/adoptform.dart' as adopt;

class PetCard extends StatefulWidget {
  final String name;
  final String? birth;
  final String? favorites;
  final List<String> images;
  final String shortDes;
  final String specie;
  final String longDes;
  final bool darkMode;
  final List<String> videos;

  const PetCard(
      {Key? key,
      required this.name,
      this.birth,
      this.favorites,
      required this.images,
      required this.shortDes, 
      required this.specie, 
      required this.longDes, 
      required this.videos, 
      required this.darkMode, 
      }
    ) 
    : super(key: key);

  @override
  State<PetCard> createState() =>
      _PetCard();
}

class _PetCard extends State<PetCard> {
  PageController imagecontroller = PageController();
  PageController videocontroller = PageController();
  // String icon_specie;
  bool selected = false;
  late final List<Widget> imagePages;
  late final List<Widget> videoPages;
  // late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    imagePages = List.generate(widget.images.length, (index) => Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: widget.darkMode ? Colors.blue : Colors.red),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SizedBox(
        height: 20,
        child: Center(
          child: Image(
              alignment: const Alignment(-1, -1),
              image: AssetImage(widget.images[index]),
              // height: height / 4,
              // width: width / 5,
              fit: BoxFit.contain,
            ),
        ),
      ),
    ));

    videoPages = List.generate(widget.videos.length, (index) => Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: widget.darkMode ? Colors.blue : Colors.red),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SizedBox(
        height: 20,
        child: Center(
          child: VideoPlayerApp(linkVideo: widget.videos[index],),
        ),
      ),
    ));


  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double width = size.width;
    final double height = size.height;

    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          alignment:
                selected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: const Duration(milliseconds: 777),
          curve: Curves.fastOutSlowIn,
          width: width / 2,
          height: !selected ? height / 2.3 : height * 4 / 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.darkMode ? selected ?  const Color.fromARGB(222, 219, 228, 254) : const Color.fromARGB(222, 205, 226, 248) : selected ?  const Color.fromARGB(222, 29, 46, 91) : const Color.fromARGB(222, 52, 40, 112),
          ),
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(30),

          child: Expanded(
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                        Column(
                          children: [
                            SizedBox(
                              height: height / 4,
                              width: width / 5,
                              child: 
                                  PageView.builder(
                                    controller: imagecontroller,
                                    itemCount: widget.images.length,
                                    itemBuilder: (_, index) {
                                      return imagePages[index];
                                    }),
                            ),
                            widget.images.length > 1 ? SmoothPageIndicator(
                              controller: imagecontroller, 
                              count: imagePages.length,
                              effect: const JumpingDotEffect(
                                spacing:  4.0,    
                                // radius:  2.0,       
                                dotHeight: 4,
                                dotWidth: 4,
                                verticalOffset: 6,
                                activeDotColor:  Color.fromARGB(255, 144, 158, 237),
                              ),
                            ) : const SizedBox.shrink(),
                            
                          ]
                        ),
                        Expanded(
                          child: 
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                 "Name: ${widget.name}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: widget.darkMode ? Colors.black : Colors.white,
                                ),
                              ),
                              Text(
                                "Specie: ${widget.specie}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: widget.darkMode ? Colors.black : Colors.white,
                                ),
                              ),
                              Text(
                                "Description: ${widget.shortDes}.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: widget.darkMode ? Colors.black : Colors.white,
                                ),
                              ),
                              selected ? Text(
                                widget.longDes,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: widget.darkMode ? Colors.black : Colors.white,
                                ),
                              ) : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                ],),
                selected ? 
                Row(
                  children: <Widget>[
                        Column(
                          children: [
                            SizedBox(
                              height: height / 4,
                              width: width / 5,
                              child: 
                                  PageView.builder(
                                    controller: videocontroller,
                                    itemCount: videoPages.length,
                                    itemBuilder: (_, index) {
                                      return videoPages[index];
                                    }),
                            ),
                            widget.images.length > 1 ? SmoothPageIndicator(
                              controller: videocontroller, 
                              count: imagePages.length,
                              effect: const JumpingDotEffect(
                                spacing:  4.0,    
                                dotWidth: 4,
                                dotHeight: 4,
                                verticalOffset: 6,
                                activeDotColor:  Color.fromARGB(255, 144, 158, 237),
                              ),
                            ) : const SizedBox.shrink(),
                          ]
                        ),
                        Expanded(
                          child: 
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                 "This is sjasfsabfoboab  about hobbies ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: widget.darkMode ? Colors.black : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                  //     ]
                  //   ),
                  // ),

                  
                ],) : const SizedBox.shrink(), 

                const Expanded(child: SizedBox(height: 8)),
                // ------------- Adopt bottom text -------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: Text(
                          'Adopt',
                          style: TextStyle(
                            color: widget.darkMode ? const Color.fromARGB(255, 0, 0, 0) : const Color.fromARGB(255, 255, 255, 255),
                            )
                          ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => adopt.Adoptform()),
                          );
                        },
                      ),
                      TextButton(
                        child: Text(
                          'Contact us', 
                          style: TextStyle(
                            color: widget.darkMode ? const Color.fromARGB(255, 0, 0, 0) : const Color.fromARGB(255, 255, 255, 255),
                            )
                        ),
                        onPressed: () {},
                      ),

                      // ------------- Expand button -------------
                      !selected ? TextButton(
                        child: const Text('⬇️'),
                        onPressed: () {
                          setState(() {
                            selected = !selected;
                          });
                        },
                      ) : TextButton(
                        child: const Text('⬆️'),
                        onPressed: () {
                          setState(() {
                            selected = !selected;
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
              ],
            ),
          )
        ),
    ),);
  }
}
