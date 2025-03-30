import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../pages/adoptform.dart' as adopt;
import '../widgets/imageCarousel.dart';

class Breakpoints {
  static const sm = 640;
  static const md = 768;
  static const lg = 1024;
}

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
  final int petId;
  
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
      required this.petId,
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
    videoPlayerController.initialize();

    final chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: true,
    );

    final playerWidget = Chewie(
      controller: chewieController,
    );

    videoPages = List.generate(widget.videos.length, (index) => Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SizedBox(
        height: 20,
        child: Center(child: playerWidget,),
      ),
    ));


  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final double screenWidth = size.width;
    final double screenHeight = size.height;

    // Calculate container dimensions based on breakpoints
    double containerWidth, containerHeight;
    if (screenWidth < Breakpoints.md) {
      containerWidth = selected ? screenWidth * 0.8 : screenWidth * 0.4;
      containerHeight = selected ? screenHeight * 0.6 : screenHeight * 0.3;
    } else if (screenWidth < Breakpoints.lg) {
      containerWidth = selected ? screenWidth * 0.6 : screenWidth * 0.4;
      containerHeight = selected ? screenHeight * 0.6 : screenHeight * 0.3;
    } else {
      containerWidth = selected ? screenWidth * 0.5 : screenWidth * 0.3;
      containerHeight = selected ? screenHeight * 0.6 : screenHeight * 0.3;
    }

    return GestureDetector(
      onTap: () => setState(() => selected = !selected),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 777),
          curve: Curves.fastOutSlowIn,
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(20),
            color: widget.darkMode 
              ? selected 
                ? const Color.fromARGB(222, 219, 228, 254)
                : const Color.fromARGB(222, 205, 226, 248)
              : selected 
                ? const Color.fromARGB(222, 29, 46, 91)
                : const Color.fromARGB(222, 52, 40, 112),
          ),
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: containerHeight * 0.8,
              maxHeight: containerHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image Carousel
                SizedBox(
                  height: selected ? containerHeight * 0.4 : containerHeight * 0.6,
                  child: ManuallyControlledSlider(imgList: widget.images, selected: selected,),
                ),

                // Basic Info (Always visible)
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: widget.darkMode ? Colors.black : Colors.white,
                            ),
                          ),
                          Text(
                            widget.specie,
                            style: TextStyle(
                              fontSize: 14,
                              color: widget.darkMode ? Colors.black54 : Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Collapsible Content
                if (selected) ...[
                  const SizedBox(height: 12),
                  Text(
                    widget.shortDes,
                    style: TextStyle(
                      fontSize: 14,
                      color: widget.darkMode ? Colors.black : Colors.white,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.longDes,
                    style: TextStyle(
                      fontSize: 14,
                      color: widget.darkMode ? Colors.black : Colors.white,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],

                // Buttons Section
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: _buildButtonRow(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonRow() {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.darkMode 
            ? selected 
              ? const Color.fromARGB(222, 219, 228, 254)
              : const Color.fromARGB(222, 205, 226, 248)
            : selected 
              ? const Color.fromARGB(222, 29, 46, 91)
              : const Color.fromARGB(222, 52, 40, 112),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // ... existing buttons with modified padding ...
            _buildTextButton('Adopt', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => adopt.AdoptForm(petId: widget.petId,
                ),
              ));
            }),
            _buildTextButton('Contact', () {}),
            IconButton(
              icon: Icon(selected ? Icons.expand_less : Icons.expand_more),
              color: widget.darkMode ? Colors.black : Colors.white,
              onPressed: () => setState(() => selected = !selected),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          visualDensity: VisualDensity.compact,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: widget.darkMode ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
