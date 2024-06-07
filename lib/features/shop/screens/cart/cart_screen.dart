import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/common/widgets/products/cart/widget/cart_listview_builder.dart';
import 'package:to_do/features/shop/screens/checkout/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        leading: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ElevatedButton(
          onPressed: ()=>Get.to(()=>const CheckOutScreen()),
          child: const Text('Check out \$250'),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: CartLVB(),
      ),
    );
  }
}
