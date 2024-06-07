import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/common/custom_appbar/ktabbar.dart';
import 'package:to_do/common/widgets/brand/brand_card.dart';
import 'package:to_do/common/widgets/custom_shoppin_icon/custom_shopping_icon.dart';
import 'package:to_do/common/widgets/layout/grid_layout.dart';
import 'package:to_do/common/widgets/search_container/search_container.dart';
import 'package:to_do/common/widgets/text/heading_text.dart';
import 'package:to_do/features/shop/screens/shop/widget/catogery_tab.dart';
import 'package:to_do/features/shop/screens/view_all_brands/brand_screen.dart';
import 'package:to_do/utils/constants/colors.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: CAppBar(
          isLeadingShow: false,
          leading: false,
          title: Text(
            'Shop',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          action: [
            CShoppingIcon(
              iconColor: dark ? TColor.grey : TColor.black,
              onPress: () {},
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, isScrroled) {
            return [
              SliverAppBar(
                floating: true,
                automaticallyImplyLeading: false,
                pinned: true,
                backgroundColor: dark ? Colors.black : TColor.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(24),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const CSearchBar(
                        text: 'Search in store',
                        isBgColor: false,
                        isBorderColor: true,
                        padding: EdgeInsets.symmetric(horizontal: 0),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      KSectionHeading(
                        title: 'Featured Brands',
                        onPress: ()=>Get.to(()=>const AllBrandScreen()),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GridLayOut(
                        mainAxisExtent: 88,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return const KBrandCard(
                            showBorder: true,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                bottom: const KTabBar(
                  tabList: [
                    Tab(text: 'Sports'),
                    Tab(text: 'Electronic'),
                    Tab(text: 'Shoes'),
                    Tab(text: 'Clothes'),
                    Tab(text: 'Furniture'),
                    Tab(text: 'Cosmatics'),
                  ],
                ),
              )
            ];
          },
          body: const TabBarView(
            children: [
              CatagoryTab(),
              CatagoryTab(),
              CatagoryTab(),
              CatagoryTab(),
              CatagoryTab(),
              CatagoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}





// ds-24 sm-8
// 1-2-3
