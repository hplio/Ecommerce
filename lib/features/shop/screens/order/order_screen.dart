import 'package:flutter/material.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/features/shop/screens/order/widget/order_card.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        title: Text(
          'My Order',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: OrderCard(),
      ),
    );
  }
}
