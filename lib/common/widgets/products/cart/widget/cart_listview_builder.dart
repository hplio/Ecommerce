import 'package:flutter/material.dart';
import 'package:to_do/common/widgets/products/cart/add_remove_btn.dart';
import 'package:to_do/common/widgets/products/cart/cart_card.dart';
import 'package:to_do/common/widgets/text/price_product.dart';

class CartLVB extends StatelessWidget {
  const CartLVB({
    super.key,
   this.isShowAddRemoveBtn=true,
  });

  final bool isShowAddRemoveBtn;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: 32,
      ),
      itemCount: 2,
      itemBuilder: (_, __) =>Column(
        children: [
          const KCartCard(),
         if(isShowAddRemoveBtn) const SizedBox(
            height: 16,
          ),
         if(isShowAddRemoveBtn) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 80,
                  ),
                  KAddRemoveBtn(),
                ],
              ),
              PriceProduct(price: '250'),
            ],
          )
        ],
      ),
    );
  }
}
