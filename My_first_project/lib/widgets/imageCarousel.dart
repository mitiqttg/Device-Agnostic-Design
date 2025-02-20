import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class ManuallyControlledSlider extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _ManuallyControlledSliderState();
//   }
// }

class ManuallyControlledSlider extends StatefulWidget {
  final List<String> imgList;
  const ManuallyControlledSlider({
    Key? key,
    required this.imgList,
  }) : super(key: key);

  @override
  State<ManuallyControlledSlider> createState() => _ManuallyControlledSliderState();
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final List<Widget> imageSliders = widget.imgList
    .map((item) =>  Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const  BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.fill, width: screenWidth),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(199, 95, 201, 250),
                              Color.fromARGB(0, 159, 195, 236)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                    ),
                  ],
                )),
          ),
        )
    .toList();
    return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: screenHeight/4, width: screenWidth/3, child: CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                  enlargeCenterPage: true, autoPlay: widget.imgList.length > 1,
                  enableInfiniteScroll: widget.imgList.length > 1, aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
                ),
                carouselController: _controller,  
              ),),
              widget.imgList.length > 1 ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: screenWidth/40,
                      height: screenHeight/80,
                      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark
                                  ? Color.fromARGB(198, 176, 179, 180)
                                  : Color.fromARGB(198, 87, 92, 94)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  ));
                }).toList(),
              ) : const SizedBox.shrink(),
            ],
          ),
        );
  }
}