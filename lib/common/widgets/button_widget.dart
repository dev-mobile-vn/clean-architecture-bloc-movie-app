import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String btnText;
  final VoidCallback action;
  const ButtonWidget({super.key, required this.btnText, required this.action});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            minimumSize: Size(MediaQuery.sizeOf(context).width, 52)),
        child: Text(btnText, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white)),
        onPressed: () => action.call());
  }
}
