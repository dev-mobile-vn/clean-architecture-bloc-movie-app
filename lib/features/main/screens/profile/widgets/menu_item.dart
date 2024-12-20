import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/svg_widget.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String icLeft;
  final VoidCallback action;

  const MenuItem({super.key, required this.title, required this.icLeft, required this.action});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action.call(),
      behavior: HitTestBehavior.translucent,
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          SvgWidget(ic: icLeft),
          const SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 16),
          ),
          const Spacer(),
          const SvgWidget(ic: 'assets/icons/ic_arrow_right.svg'),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
