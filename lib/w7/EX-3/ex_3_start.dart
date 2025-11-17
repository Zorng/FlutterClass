import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];


void main() => runApp(
  MaterialApp(
    // hide the debug banner that appears on the top right of the scaffold
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    home: MyCarousel(initialImageIndex: 3,)
  ),
);

class MyCarousel extends StatefulWidget {
  final int initialImageIndex;
  const MyCarousel({super.key, this.initialImageIndex = 0}) : assert(initialImageIndex >= 0 && initialImageIndex <= 5, "Initial index must be within valid image index");

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  late int imageIndex;

  @override
  void initState() {
    imageIndex = widget.initialImageIndex;
    super.initState();
  }

  void forward() {
    setState(() {
      imageIndex = imageIndex == images.length - 1 ? 0 : imageIndex + 1;
    });
  }

  void backward() {
    setState(() {
      imageIndex = imageIndex == 0 ? images.length - 1 : imageIndex - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: backward,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed:forward,
            ),
          ),
        ],
      ),
      body: Image.asset(images[imageIndex]),
    );
  }
}
