import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class KProfileInfoTile extends StatelessWidget {
  const KProfileInfoTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.iconData = Iconsax.arrow_right_34,
    this.onPress,
  });

  final String title;
  final String subTitle;
  final IconData? iconData;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16 / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Expanded(
              child: Icon(iconData),
            ),
          ],
        ),
      ),
    );
  }
}
