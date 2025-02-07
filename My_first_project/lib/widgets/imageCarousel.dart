import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  final List<String> imagesVids;

  const Carousel(
    {
      Key? key,
      required this.imagesVids,
    }
  ) : super(key: key);

  @override
  State<Carousel> createState() => _Carousel();
}

class _Carousel extends State<Carousel> {
  late PageController _pageController;
  // late List<String> images = widget.imagesVids;
  late List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: size.width / 2.5,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(images, pagePosition, active);
              }),
        ),
        Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: indicators(images.length,activePage))
      ],
    );
  }
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 10 : 20;

  return AnimatedContainer(
    duration: const Duration(seconds: 1),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(images[pagePosition]))),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    
    animation: animation,
    builder: (context, widget) {
      final Size size = MediaQuery.sizeOf(context);

      return SizedBox(
        height: size.height / 4,
        width: size.width / 5,
        child: widget,
      );
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Image.network(images[pagePosition]),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}