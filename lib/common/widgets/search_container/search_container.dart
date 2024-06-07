import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/utils/constants/colors.dart';

class CSearchBar extends StatelessWidget {
  const CSearchBar({
    super.key,
    required this.text,
    this.isBgColor = true,
    this.isBorderColor = true,
    this.icon = Iconsax.search_normal,
    this.onPress,
    this.padding=const EdgeInsets.symmetric(horizontal: 24),
  });

  final String text;
  final bool isBgColor, isBorderColor;
  final IconData? icon;
  final void Function()? onPress;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: padding,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: isBorderColor
                  // ? Border.all(color: dark ? TColor.dark : TColor.grey)
                  ? Border.all(color: dark ? TColor.grey :TColor.darkGrey )
                  : null,
              color: isBgColor
                  ? dark
                      ? TColor.dark
                      : TColor.light
                  : Colors.transparent),
          child: Row(
            children: [
              Icon(
                icon,
                color: TColor.darkerGrey,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
