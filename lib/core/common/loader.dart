// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
    this.color = Colors.deepOrange,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 10,
      ),
    );
  }
}
