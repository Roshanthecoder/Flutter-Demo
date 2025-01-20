// utils/snackbar_toast.dart
import 'package:flutter/material.dart';

class SnackbarToast {
  // Displaying SnackBar
  static void showSnackBar(BuildContext context, String message, {Color backgroundColor = Colors.black}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Displaying Toast (platform-specific)
  static void showToast(BuildContext context, String message) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      // Android Toast
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      // iOS Toast
      final overlay = Overlay.of(context);
      final entry = OverlayEntry(
        builder: (context) => Positioned(
          bottom: 80,
          left: 16,
          right: 16,
          child: Material(
            elevation: 5.0,
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
      overlay?.insert(entry);
      Future.delayed(Duration(seconds: 3), () {
        entry.remove();
      });
    }
  }
}
