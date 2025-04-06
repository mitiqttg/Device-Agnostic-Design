import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ManuallyControlledSlider extends StatefulWidget {
  final List<String> imgList;
  
  final bool selected;
  const ManuallyControlledSlider({
    Key? key,
    required this.imgList,
    required this.selected,
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
                borderRadius: const  BorderRadius.all(Radius.circular(15.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.fill),
                        if (widget.selected && widget.imgList.length > 1)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () => _controller.previousPage(),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward_ios),
                              onPressed: () => _controller.nextPage(),
                            ),
                          ],
                        ),
                  ],
                )),
          ),
        )
    .toList();
    return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: screenHeight/4, 
                width: screenWidth/3, 
                // height: 50, 
                // width: 60, 
                child: CarouselSlider(
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
                ),
              ),
              widget.imgList.length > 1 ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 5,
                      height: 5,
                      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark
                                  ? const Color.fromARGB(198, 176, 179, 180)
                                  : const Color.fromARGB(197, 8, 8, 8)
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