import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/widgets/icon_btn_container/icon_btn_container.dart';
import 'package:to_do/utils/constants/colors.dart';

class BottomNavigationPd extends StatelessWidget {
  const BottomNavigationPd({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24 / 2),
      decoration: BoxDecoration(
        color: dark ? TColor.darkerGrey : TColor.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              KIconContainer(
                width: 40,
                height: 40,
                iconInfo: Iconsax.minus,
                onPress: () {},
                iconColor: TColor.white,
                bgColor: TColor.darkGrey,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                '1',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: 16,
              ),
              KIconContainer(
                width: 40,
                height: 40,
                iconInfo: Iconsax.add,
                onPress: () {},
                iconColor: TColor.white,
                bgColor: TColor.black,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: TColor.black,
                side: const BorderSide(color: TColor.black)),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
