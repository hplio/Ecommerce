import 'package:flutter/material.dart';
import 'package:to_do/common/custom_shap/container_unfixed_hight.dart';
import 'package:to_do/utils/constants/colors.dart';

class KCoupenBox extends StatelessWidget {
  const KCoupenBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return UnFixedHightContainer(
      showBorderColor: true,
      isPaddingOnly: true,
      color: dark ? TColor.dark : TColor.white,
      top: 8,
      bottom: 8,
      right: 8,
      left: 16,
      child: Row(
        children: [
          const Flexible(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Have Promo Code? Enter Here',
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark
                    ? TColor.white.withOpacity(.5)
                    : TColor.dark.withOpacity(.5),
                backgroundColor: TColor.grey.withOpacity(.2),
                side: BorderSide(
                  color: TColor.grey.withOpacity(.1),
                ),
              ),
              child: const Text('Apply'),
            ),
          )
        ],
      ),
    );
  }
}
