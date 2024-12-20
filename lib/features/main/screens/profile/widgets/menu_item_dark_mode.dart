import 'package:flutter/material.dart';

import '../../../../../core/common/translations/l10n.dart';
import '../../../../../core/common/widgets/svg_widget.dart';

class MenuItemDarkMode extends StatefulWidget {
  const MenuItemDarkMode({super.key});

  @override
  State<MenuItemDarkMode> createState() => _MenuItemDarkModeState();
}

class _MenuItemDarkModeState extends State<MenuItemDarkMode> {
  ValueNotifier<bool> isDarkMode = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 16,
        ),
        const SvgWidget(ic: 'assets/icons/ic_dark_mode.svg'),
        const SizedBox(
          width: 16,
        ),
        Text(
          S.of(context).label_menu_dark_mode,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            isDarkMode.value = !isDarkMode.value;
          },
          child: ValueListenableBuilder<bool>(
            valueListenable: isDarkMode,
            builder: (context, isDarkMode, child) {
              return Container(
                  width: 44,
                  height: 24,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white : Colors.grey.withOpacity(0.5),
                    border: Border.all(
                        color: isDarkMode ? Theme.of(context).colorScheme.primary.withOpacity(0.5) : Colors.grey.withOpacity(0.5),
                        width: isDarkMode ? 1 : 0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: isDarkMode ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    height: 24,
                    width: 22,
                    decoration: BoxDecoration(color: isDarkMode ? Theme.of(context).colorScheme.primary : Colors.white, shape: BoxShape.circle),
                  ));
            },
          ),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
