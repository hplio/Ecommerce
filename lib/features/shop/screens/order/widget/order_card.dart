import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/custom_shap/container_unfixed_hight.dart';
import 'package:to_do/utils/constants/colors.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) {
        return const SizedBox(
          height: 16,
        );
      },
      itemBuilder: (_, index) {
        return const SingleOrderCard();
      },
    );
  }
}

class SingleOrderCard extends StatelessWidget {
  const SingleOrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;

    return UnFixedHightContainer(
      padding: 16,
      showBorderColor: true,
      color: dark ? TColor.dark : TColor.light,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Iconsax.ship,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Processing',
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: TColor.primary,
                            fontSizeDelta: 1,
                          ),
                    ),
                    Text(
                      '12 NOV 2024',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Iconsax.tag,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order',
                              style: Theme.of(context).textTheme.labelMedium),
                          Text(
                            '#36452',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Iconsax.calendar,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Shipping Date',
                              style: Theme.of(context).textTheme.labelMedium),
                          Text(
                            '24 Nov 2024',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// im-24 ds-24 sbi-16 sbs-32 CL-16 md-16 sbif-16 sm-8

