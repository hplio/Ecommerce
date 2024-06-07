import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/widgets/layout/grid_layout.dart';
import 'package:to_do/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:to_do/utils/constants/colors.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: dark ? TColor.grey : TColor.darkGrey),
            ),
            prefixIcon: const Icon(
              Iconsax.sort,
            ),
          ),
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map(
                (option) => DropdownMenuItem(
                  value: option,
                  child: Text(option),
                ),
              )
              .toList(),
          onChanged: (value) {},
        ),
        const SizedBox(
          height: 32,
        ),
        GridLayOut(
          itemCount: 6,
          itemBuilder: (_, index) => const ProductCardVertical(),
        )
      ],
    );
  }
}
