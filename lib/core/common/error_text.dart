import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({
    super.key,
    required this.error,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            error,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () => Routemaster.of(context).pop(),
            child: const Text("Go Back"),
          ),
        ],
      ),
    );
  }
}
