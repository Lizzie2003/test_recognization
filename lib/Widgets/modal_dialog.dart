import 'package:flutter/material.dart';

void imagePickerModal(BuildContext context,
    {VoidCallback? onCameraTap, VoidCallback? onGallerieTap}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            padding: const EdgeInsets.all(20),
            height: 220,
            child: Column(
              children: [
                GestureDetector(
                  onTap: onCameraTap,
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    // ignore: prefer_const_constructors
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: const Text("Camera",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: onGallerieTap,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    // ignore: prefer_const_constructors
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: const Text("Galerie",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ),
              ],
            ));
      });
}
