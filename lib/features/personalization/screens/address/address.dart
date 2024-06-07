import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/features/personalization/screens/address/add_new_address.dart';
import 'package:to_do/features/personalization/screens/address/widget/single_address.dart';
import 'package:to_do/utils/constants/colors.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        leading: true,
        title: Text('Address',
        style: Theme.of(context).textTheme.headlineSmall,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Get.to(()=>const NewAddressScreen()),
        backgroundColor: TColor.primary,
        child: const Icon(
          Iconsax.add,
        color: TColor.white,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              SingleAdress(isSelected: true,),
              SingleAdress(isSelected: false,),
              SingleAdress(isSelected: false,),
              
            ],
          ),
        ),
      ),
    );
  }
}







