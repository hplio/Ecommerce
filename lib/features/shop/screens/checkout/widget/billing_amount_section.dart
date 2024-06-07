import 'package:flutter/material.dart';
import 'package:to_do/common/widgets/text/checkout_biling_text.dart';

class BilingAmountSection extends StatelessWidget {
  const BilingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KCheckOutBiling(
          title_1: 'Subtotal',
          title_2: '\$250',
          title_1Style: Theme.of(context).textTheme.bodyMedium,
          title_2Style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        KCheckOutBiling(
          title_1: 'Shipping Fee',
          title_2: '\$6',
          title_1Style: Theme.of(context).textTheme.bodyMedium,
          title_2Style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        KCheckOutBiling(
          title_1: 'Tax Fee',
          title_2: '\$250',
          title_1Style: Theme.of(context).textTheme.bodyMedium,
          title_2Style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        KCheckOutBiling(
          title_1: 'Order Total',
          title_2: '\$26',
          title_1Style: Theme.of(context).textTheme.bodyMedium,
          title_2Style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}


// im-24 ds-24 sbi-16 sbs-32 CL-16 md-16 sbif-16 sm-8