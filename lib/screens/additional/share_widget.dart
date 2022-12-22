import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareWidget extends StatelessWidget {
  ShareWidget({super.key, required this.directory, required this.imageData});
  Directory directory;
  Uint8List? imageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Share Screenshot"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 600,
            height: 600,
            decoration: BoxDecoration(
              image: imageData == null
                  ? null
                  : DecorationImage(
                      image: MemoryImage(imageData!),
                    ),
            ),
          ),
          imageData == null
              ? const Text("Could not load Image")
              : const Text(""),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              textStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              Share.shareFiles(
                ['${directory.path}/weather_ss.jpg'],
                text: "Today's weather",
              );
            },
            child: const Text("Share"),
          ),
        ],
      ),
    );
  }
}
