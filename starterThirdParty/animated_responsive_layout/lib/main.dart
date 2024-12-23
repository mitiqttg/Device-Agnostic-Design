import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScrollToTopPage(),
    );
  }
}

class ScrollToTopPage extends StatefulWidget {
  @override
  _ScrollToTopPageState createState() => _ScrollToTopPageState();
}

class _ScrollToTopPageState extends State<ScrollToTopPage> {
  // Create a ScrollController to control the scrolling
  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll to Top Example'),
      ),
      body: Stack(
        children: [
          
          // Floating Action Button to scroll to the top
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: () {
                // Scroll to the top of the page with smooth animation
                _scrollController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              backgroundColor: Colors.transparent, // Transparent background
              elevation: 0, // Remove shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Rounded button
              ),
              child: const Icon(Icons.arrow_upward, color: Colors.blue), // Icon color
            ),
          ),
        ],
      ),
    );
  }
}
