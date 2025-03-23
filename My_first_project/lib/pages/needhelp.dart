import 'package:flutter/material.dart';

class ExpandableOverlayContainer extends StatefulWidget {
  const ExpandableOverlayContainer({super.key});

  @override
  State<ExpandableOverlayContainer> createState() =>
      _ExpandableOverlayContainerState();
}

class _ExpandableOverlayContainerState
    extends State<ExpandableOverlayContainer> {
  // Track the index of the expanded container
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expandable Overlay Container'),
      ),
      body: Stack(
        children: [
          GridView.extent(
            maxCrossAxisExtent: 200, // Maximum width of each grid item
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: const EdgeInsets.all(10),
            children: List.generate(80, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle the expanded state
                    if (_expandedIndex == index) {
                      _expandedIndex = null; // Collapse if already expanded
                    } else {
                      _expandedIndex = index; // Expand the clicked container
                    }
                  });
                },
                child: Container(
                  color: _expandedIndex == index ? Colors.orange : Colors.purple,
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          if (_expandedIndex != null)
            Positioned(
              top: 20,
              left: 20,
              width: screenWidth*0.8,
              height: screenHeight*0.8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _expandedIndex = null; // Collapse the overlay
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  color: Colors.orange,
                  child: Center(
                    child: Text(
                      'Item $_expandedIndex',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ExpandableOverlayContainer(),
  ));
}