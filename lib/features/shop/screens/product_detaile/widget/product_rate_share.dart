import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class KProductRateShare extends StatelessWidget {
  const KProductRateShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 8,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '5.0',
                      style:
                          Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(
                    text: '(200)',
                  ),
                ],
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            size: 24,
          ),
        ),
      ],
    );
  }
}
