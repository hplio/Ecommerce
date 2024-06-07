import 'package:flutter/material.dart';
import 'package:to_do/common/custom_shap/container_unfixed_hight.dart';
import 'package:to_do/common/widgets/text/heading_text.dart';
import 'package:to_do/utils/constants/colors.dart';

class BilingPaymentSection extends StatelessWidget {
  const BilingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPress: () {},
          padding: EdgeInsets.zero,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            UnFixedHightContainer(
              hight: 35,
              width: 60,
              color: dark ? TColor.light : TColor.white,
              padding: 8,
              child: const Image(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/Payment_img/gpay.png'),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Google Pay',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ],
    );
  }
}


// im-24 ds-24 sbi-16 sbs-32 CL-16 md-16 sbif-16 sm-8