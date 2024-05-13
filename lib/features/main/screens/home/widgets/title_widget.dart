import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback action;

  const TitleWidget({super.key, required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!,
        ),
        InkWell(
          onTap: () => action.call(),
          child: Text(
            'See all',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
