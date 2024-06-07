import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/custom_shap/container_unfixed_hight.dart';
import 'package:to_do/utils/constants/colors.dart';

class SingleAdress extends StatelessWidget {
  const SingleAdress({
    super.key,
    required this.isSelected,
  });
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return UnFixedHightContainer(
      width: double.infinity,
      padding: 16,
      radius: 16,
      margin: const EdgeInsets.only(bottom: 16),
      showBorderColor: true,
      color: isSelected ? TColor.primary.withOpacity(.5) : Colors.transparent,
      borderColor: isSelected
          ? Colors.transparent
          : dark
              ? TColor.darkerGrey
              : TColor.grey,
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              isSelected ? Iconsax.tick_circle5 : null,
              color: isSelected
                  ? dark
                      ? TColor.light.withOpacity(.6)
                      : TColor.dark.withOpacity(.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text(
                'Harshil Patel',
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 4,
              ),
              const Text('(+91) 2145214569'),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Pathher get uplafaliya, vadodara, india',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
