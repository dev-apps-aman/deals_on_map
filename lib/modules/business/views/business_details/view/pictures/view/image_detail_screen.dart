import 'package:flutter/material.dart';
class ImageDetailScreen extends StatelessWidget {
  final int imageIndex;
  final String imageUrl;

  const ImageDetailScreen({
    super.key,
    required this.imageIndex,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Hero(
            tag: 'picture_$imageIndex',
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}