import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(title: Text("Custom buttons"), centerTitle: false),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20,
            children: [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    ),
  );
}

enum Product {
  dart("Dart", "The best object language", "assets/images/dart.webp"),
  flutter(
    "Flutter",
    "The best mobile widge library",
    "assets/images/flutter.webp",
  ),
  firebase("Firebase", "The best cloud database", "assets/images/firebase.png");

  final String title;
  final String description;
  final String image;

  const Product(this.title, this.description, this.image);
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Image.asset(product.image, width: 150, height: 150),
            Text(product.title, style: TextStyle(fontSize: 50)),
            Text(product.description, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
