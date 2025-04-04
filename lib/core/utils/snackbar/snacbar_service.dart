import 'package:flutter/material.dart';
import 'package:solano_app/app/constants/color_constants.dart';

abstract class SnackbarService {
  void showError(String title, String message);
  void showSuccess(String title, String message);
}

class SnackbarServiceImpl implements SnackbarService {

  SnackbarServiceImpl(this.scaffoldMessengerKey);
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  @override
  void showError(String title, String message) {
    _showSnackbar(title, message, ColorConstants.redColor);
  }

  @override
  void showSuccess(String title, String message) {
    _showSnackbar(title, message, ColorConstants.greenColor);
  }

  void _showSnackbar(String title, String message, Color backgroundColor) {
    final snackBar = SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    );

    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
