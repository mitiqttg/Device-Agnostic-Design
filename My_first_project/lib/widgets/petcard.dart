import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../pages/adoptform.dart' as adopt;
import '../widgets/imageCarousel.dart';

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
  bool selected = false;
  late final List<Widget> imagePages;
  late final List<Widget> videoPages;
  final videoPlayerController = VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'));

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    videoPlayerController.initialize();

    final chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: true,
    );

    final playerWidget = Chewie(
      controller: chewieController,
    );
    final Size size = MediaQuery.sizeOf(context);
    final double screenWidth= size.width;
    final double screenHeight = size.height;

    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        }); 
      },
      
        child: AnimatedContainer(
          alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: const Duration(milliseconds: 777),
          curve: Curves.fastOutSlowIn,
          width: selected ? screenWidth * 0.9 : screenWidth * 0.3,
          height: selected ? screenHeight * 0.9 : screenHeight *  0.4,
          decoration: BoxDecoration(
            border: Border.all( width: 1,),
            borderRadius: BorderRadius.circular(20),
            color: widget.darkMode ? selected ?  const Color.fromARGB(222, 219, 228, 254) : const Color.fromARGB(222, 205, 226, 248) : selected ?  const Color.fromARGB(222, 29, 46, 91) : const Color.fromARGB(222, 52, 40, 112),
          ),
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                ManuallyControlledSlider(imgList: widget.images, selected: selected),
                Text(
                  "Name: ${widget.name}",
                  style: TextStyle(
                    fontSize: 16,
                    color: widget.darkMode ? Colors.black : Colors.white,
                  ),
                  overflow: TextOverflow.fade,
                ),
                Expanded(
                  child : selected ? Row(
                    children: <Widget>[
                      Flexible(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Specie: ${widget.specie}",
                            style: TextStyle(
                              fontSize: 16,
                              color: widget.darkMode ? Colors.black : Colors.white,
                            ),
                            overflow: TextOverflow.fade,
                          ),
                          Text(
                            "Description: ${widget.shortDes}.",
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 16,
                              color: widget.darkMode ? Colors.black : Colors.white,
                            ),
                          ),
                          selected ? Text(
                            widget.longDes,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 16,
                              color: widget.darkMode ? Colors.black : Colors.white,
                            ),
                          ) : const SizedBox.shrink(),
                        ],
                      ),)
                    ],
                  ) : const SizedBox.shrink()
                ),
                selected ? 
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   height: screenHeight / 4,
                      //   width: screenWidth / 5,
                      //   child: playerWidget,
                      // ),
                      Text(
                        "This is sjasfsabfoboab  about hobbies ",
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.darkMode ? Colors.black : Colors.white,
                        ),
                      ),
                    ], 
                ) : const SizedBox.shrink(), 

                // ------------- Adopt bottom text -------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget> [
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
                  
                  ],
                ),
                const SizedBox(width: 8),
              ],
            ), 
        ),
    );
    
  }

}
