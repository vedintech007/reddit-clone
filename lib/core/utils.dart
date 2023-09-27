import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String text,
  bool isError = false,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red : null,
        margin: const EdgeInsets.all(12),
        behavior: SnackBarBehavior.floating,
        content: Text(
          text,
          style: TextStyle(
            color: isError ? Colors.white : null,
          ),
        ),
      ),
    );
}
