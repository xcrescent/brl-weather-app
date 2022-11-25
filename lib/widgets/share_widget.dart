import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShareWidget extends StatelessWidget {
  ShareWidget({super.key, required this.imageData});
  Uint8List? imageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          decoration: BoxDecoration(
              image: imageData == null
                  ? null
                  : DecorationImage(image: MemoryImage(imageData!)))),
    );
  }
}
