import 'package:flutter/material.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/common/widgets/brand/brand_card.dart';
import 'package:to_do/common/widgets/products/sortable/product_sortable.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        title: Text(
          'Nike',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
                KBrandCard(showBorder: true),
                SizedBox(
                  height: 32,
                ),
                SortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}


// im-24 ds-24 sbi-16 sbs-32 CL-16 md-16 sbif-16 sm-8
