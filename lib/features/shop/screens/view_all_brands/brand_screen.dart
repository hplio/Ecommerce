import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/common/widgets/brand/brand_card.dart';
import 'package:to_do/common/widgets/layout/grid_layout.dart';
import 'package:to_do/common/widgets/text/heading_text.dart';
import 'package:to_do/features/shop/screens/view_all_brands/brand_products.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        title: Text(
          'Products Brands',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const KSectionHeading(
                title: 'Brands',
                showTextButton: false,
              ),
              const SizedBox(
                height: 16,
              ),
              GridLayOut(
                itemCount: 6,
                mainAxisExtent: 80,
                itemBuilder: (_, index) =>KBrandCard(
                  showBorder: true,
                  onPress: ()=>Get.to(const BrandProduct()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// im-24 ds-24 sbi-16 sbs-32 CL-16 md-16 sbif-16 sm-8
