import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/common/custom_shap/container_unfixed_hight.dart';
import 'package:to_do/common/widgets/products/cart/widget/cart_listview_builder.dart';
import 'package:to_do/common/widgets/products/cart/widget/coupen_box.dart';
import 'package:to_do/common/widgets/success_screen/success_screen.dart';
import 'package:to_do/features/authentication/screens/navigation_bar/bottom_navigation_screen.dart';
import 'package:to_do/features/shop/screens/checkout/widget/billing_address_section.dart';
import 'package:to_do/features/shop/screens/checkout/widget/billing_amount_section.dart';
import 'package:to_do/features/shop/screens/checkout/widget/billing_payment_section.dart';
import 'package:to_do/utils/constants/colors.dart';
import 'package:to_do/utils/constants/size.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: CAppBar(
        leading: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccsessScreen(
              upperImgHight: KSizeScreen.getScreenHeight(context)*.2,
              imageString: 'assets/images/succsess_img/succses_screen.png',
              title: 'Payment succsess!',
              subTitle: 'Your item will be shipped soon!',
              onPress: () => Get.offAll(
                () => const BottomNavigationBarAll(),
              ),
            ),
          ),
          child: const Text('Click'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const CartLVB(
                isShowAddRemoveBtn: false,
              ),
              const SizedBox(
                height: 32,
              ),
              const KCoupenBox(),
              const SizedBox(
                height: 16,
              ),
              UnFixedHightContainer(
                showBorderColor: true,
                padding: 16,
                color: dark ? TColor.black : TColor.white,
                child: const Column(
                  children: [
                    BilingAmountSection(),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(),
                    SizedBox(
                      height: 16,
                    ),
                    BilingPaymentSection(),
                    SizedBox(
                      height: 16,
                    ),
                    BillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



// im-24 ds-24 sbi-16 sbs-32 CL-16 md-16 sbif-16 sm-8