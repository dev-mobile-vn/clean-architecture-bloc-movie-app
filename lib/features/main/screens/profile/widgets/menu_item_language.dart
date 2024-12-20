import 'package:flutter/material.dart';

import '../../../../../core/common/translations/l10n.dart';
import '../../../../../core/common/widgets/svg_widget.dart';

class MenuItemLanguage extends StatelessWidget {
  const MenuItemLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 16,
        ),
        const SvgWidget(ic: 'assets/icons/ic_language.svg'),
        const SizedBox(
          width: 16,
        ),
        Text(
          S.of(context).label_menu_language,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 16),
        ),
        const Spacer(),
        Text('English (US)',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 14)),
        const SizedBox(
          width: 16,
        ),
        InkWell(onTap: () {}, child: const SvgWidget(ic: 'assets/icons/ic_arrow_right.svg')),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
