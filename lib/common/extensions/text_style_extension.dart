import 'package:flutter/material.dart';

extension TextStyleExtension on BuildContext {
  ///Start title

  TextStyle get titleSmall => Theme.of(this)
      .textTheme
      .titleSmall!
      .copyWith(color: const Color(0xFF424242), fontSize: 14, fontWeight: FontWeight.w400);

  TextStyle get titleMedium => Theme.of(this)
      .textTheme
      .titleMedium!
      .copyWith(color: const Color(0xFF424242), fontSize: 16, fontWeight: FontWeight.bold);

  TextStyle get titleLarge => Theme.of(this)
      .textTheme
      .titleLarge!
      .copyWith(color: const Color(0xFF424242), fontSize: 18, fontWeight: FontWeight.bold);

  ///End title

  ///Start label

  TextStyle get labelSmall => Theme.of(this)
      .textTheme
      .labelSmall!
      .copyWith(color: const Color(0xFF424242), fontSize: 14, fontWeight: FontWeight.w400);

  TextStyle get labelMedium => Theme.of(this)
      .textTheme
      .labelMedium!
      .copyWith(color: const Color(0xFF424242), fontSize: 16, fontWeight: FontWeight.w600);

  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600, fontSize: 16);

  ///End label

  ///Start body

  TextStyle get bodySmall => Theme.of(this)
      .textTheme
      .bodySmall!
      .copyWith(color: const Color(0xFF424242), fontSize: 14, fontWeight: FontWeight.w400);

  TextStyle get bodyMedium => Theme.of(this)
      .textTheme
      .bodyMedium!
      .copyWith(color: const Color(0xFF424242), fontSize: 16, fontWeight: FontWeight.normal);

  TextStyle get bodyLarge => Theme.of(this)
      .textTheme
      .bodyLarge!
      .copyWith(color: const Color(0xFF424242), fontSize: 18, fontWeight: FontWeight.bold);

  ///End body
}
