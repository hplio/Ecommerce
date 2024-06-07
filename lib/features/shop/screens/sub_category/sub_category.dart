import 'package:flutter/material.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/common/widgets/img_container/round_img_container.dart';
import 'package:to_do/common/widgets/products/products_card/product_card_horizontal.dart';
import 'package:to_do/common/widgets/text/heading_text.dart';

class SubCategoty extends StatelessWidget {
  const SubCategoty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        leading: true,
        title: Text(
          'Sports',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const KImageContainer(
                applyImageRadius: true,
                width: double.infinity,
                imgString: 'assets/images/banner_img/banner_img-2.jpg',
              ),
              const SizedBox(
                height: 32,
              ),
              Column(
                children: [
                  KSectionHeading(
                    title: 'Sports Shirts',
                    showTextButton: true,
                    onPress: () {},
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 16,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return const ProductCardHorizontal();
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// im-24 ds-24 sbi-16 sbs-32 CL-16 md-16 sbif-16 sm-8
