import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/widgets/icon_btn_container/icon_btn_container.dart';
import 'package:to_do/utils/constants/colors.dart';

class KAddRemoveBtn extends StatelessWidget {
  const KAddRemoveBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        KIconContainer(
          height: 40,
          width: 40,
          iconInfo: Iconsax.minus,
          iconColor: dark ? TColor.white : TColor.black,
          bgColor: dark ? TColor.darkerGrey : TColor.light,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: 16,
        ),
        const KIconContainer(
          height: 40,
          width: 40,
          iconInfo: Iconsax.add,
          iconColor: TColor.white,
          bgColor: TColor.primary,
        ),
      ],
    );
  }
}
