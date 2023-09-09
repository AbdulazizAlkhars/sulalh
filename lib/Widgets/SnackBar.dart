import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(BuildContext context, String message) {
    final overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox?;

    if (overlay != null) {
      final box = overlay.paintBounds;
      final snackBarWidth = box.size.width * 0.6; // Adjust the width as desired

      OverlayEntry entry = OverlayEntry(
        builder: (BuildContext context) {
          return Positioned(
            bottom: 80.0, // Adjust the bottom margin as desired
            left: (box.size.width - snackBarWidth) / 2.0,
            width: snackBarWidth,
            child: Material(
              elevation: 4.0,
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        message,
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

      Overlay.of(context).insert(entry);

      Future.delayed(const Duration(seconds: 3)).then((_) {
        entry.remove();
      });
    }
  }
}
