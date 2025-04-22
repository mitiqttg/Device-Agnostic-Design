import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../pages/adoptform.dart' as adopt;
import '../widgets/imageCarousel.dart';

class Breakpoints {
  static const sm = 640;
  static const md = 768;
  static const lg = 1024;
  static const xl = 1280;
  static const xl2 = 1536;
}

class PetCard extends StatefulWidget {
  final String petName;
  final String? birth;
  final String? favorites;
  final List<String> images;
  final String shortDes; 
  final String specie;
  final String longDes;
  final List<String> videos;
  final int petId;

  const PetCard({
    Key? key,
    required this.petName,
    this.birth,
    this.favorites,
    required this.images,
    required this.shortDes,
    required this.specie,
    required this.longDes,
    required this.videos,
    required this.petId,
  }) : super(key: key);

  @override
  State<PetCard> createState() => _PetCard();
}

class _PetCard extends State<PetCard> {
  bool selected = false;
  final CarouselSliderController _infoController = CarouselSliderController();

  List<Widget> _buildInfoSlides(double cardWidth) {
    final textColor = Theme.of(context).colorScheme.onError; 
    final fullText = '${widget.specie}\n${widget.shortDes}${selected ? '\n${widget.longDes}' : ''}';
    const int maxLength = 300;
    List<String> parts = [];
    String remaining = fullText;

    while (remaining.isNotEmpty) {
      if (remaining.length <= maxLength) {
        parts.add(remaining);
        break;
      }
      int splitIndex = remaining.lastIndexOf(' ', maxLength);
      if (splitIndex == -1) splitIndex = maxLength;
      parts.add(remaining.substring(0, splitIndex));
      remaining = remaining.substring(splitIndex).trim();
    }

    return parts.map((part) => Container(
          width: cardWidth,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondaryContainer, 
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            part,
            style: TextStyle(fontSize: 14, color: textColor),
            softWrap: true,
          ),
        )).toList();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final double screenWidth = size.width;

    final double cardWidth = screenWidth < Breakpoints.sm
        ? screenWidth * 0.85
        : screenWidth < Breakpoints.md
            ? screenWidth * 0.7
            : screenWidth < Breakpoints.lg
                ? screenWidth * 0.5
                : 400;

    final double cardHeight = selected ? 600 : 300;

    return GestureDetector(
      onTap: () => setState(() => selected = !selected),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: cardWidth,
          height: cardHeight,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.onPrimaryContainer, 
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child: ManuallyControlledSlider(
                  imgList: widget.images,
                  videoUrl: widget.videos.isNotEmpty ? widget.videos.first : null,
                  selected: selected,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.petName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface, 
                    ),
                  ),
                  if (widget.birth != null)
                    Text(
                      widget.birth!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                ],
              ),
              if (selected) ...[
                const SizedBox(height: 8),
                Expanded(
                  child: _buildInfoSection(cardWidth),
                ),
                const SizedBox(height: 8),
              ],
              _buildButtonRow(cardWidth),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(double cardWidth) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    final infoSlides = _buildInfoSlides(cardWidth);

    if (infoSlides.length <= 1) {
      return Container(
        width: cardWidth,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onError, 
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.specie,
                style: TextStyle(fontSize: 14, color: textColor.withOpacity(0.7)),
              ),
              const SizedBox(height: 4),
              Text(
                widget.shortDes,
                style: TextStyle(fontSize: 14, color: textColor),
              ),
              if (selected) ...[
                const SizedBox(height: 4),
                Text(
                  widget.longDes,
                  style: TextStyle(fontSize: 14, color: textColor),
                ),
              ],
            ],
          ),
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          items: infoSlides,
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: false,
            enableInfiniteScroll: true,
            aspectRatio: 2.0,
            viewportFraction: 1.0,
          ),
          carouselController: _infoController,
        ),
        Positioned(
          left: 10,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Color.fromARGB(255, 0, 0, 0), size: 24),
            onPressed: () => _infoController.previousPage(),
          ),
        ),
        Positioned(
          right: 10,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 0, 0, 0), size: 24),
            onPressed: () => _infoController.nextPage(),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonRow(double cardWidth) {
    return Container(
      width: cardWidth - 32,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          _buildTextButton('Adopt', () {
            showDialog(
              context: context,
              barrierColor: Colors.transparent,
              builder: (context) => adopt.AdoptForm(
                petId: widget.petId,
                petName: widget.petName,
              ),
            );
          }),
          _buildTextButton('Contact', () {}),
          IconButton(
            icon: Icon(selected ? Icons.expand_less : Icons.expand_more),
            color: Theme.of(context).colorScheme.surface, 
            onPressed: () => setState(() => selected = !selected),
          ),
        ],
      ),
    );
  }

  Widget _buildTextButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: 80,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          backgroundColor: Theme.of(context).colorScheme.surface, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.surface, 
          ),
        ),
      ),
    );
  }
}