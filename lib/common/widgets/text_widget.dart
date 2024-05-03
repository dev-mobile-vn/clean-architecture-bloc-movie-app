import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String data;
  final TextStyle? style;
  const TextWidget({super.key, required this.data, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.bodyMedium,
    );
  }
}
