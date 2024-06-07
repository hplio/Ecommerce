import 'package:flutter/material.dart';
import 'package:to_do/common/widgets/text/heading_text.dart';
import 'package:to_do/utils/constants/colors.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KSectionHeading(
          title: 'Shopping Address',
          buttonTitle: 'Change',
          onPress: () {},
          padding: EdgeInsets.zero,
        ),
        Text(
          'Harshil Patel',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Icon(
              Icons.phone,
              color: dark? TColor.grey:TColor.darkGrey,
              size: 16,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              '+91-214-3214569',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Icon(
              Icons.location_history,
              color: dark? TColor.grey:TColor.darkGrey,
              size: 16,
            ),
            const SizedBox(
              width: 16,
            ),
            Flexible(
              child: Text(
                'Vadodara Gujarat India-398383',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// im-24 ds-24 sbi-16 sbs-32 CL-16 md-16 sbif-16 sm-8
