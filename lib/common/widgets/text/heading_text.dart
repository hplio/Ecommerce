import 'package:flutter/material.dart';

class KSectionHeading extends StatelessWidget {
  const KSectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPress,
    this.textColor,
    this.showTextButton = true,
     this.padding,
  });

  final String title;
  final String buttonTitle;
  final void Function()? onPress;
  final Color? textColor;
  final bool showTextButton;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:padding?? const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: textColor,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (showTextButton)
            TextButton(
              onPressed: onPress,
              child: Text(buttonTitle),
            ),
        ],
      ),
    );
  }
}
