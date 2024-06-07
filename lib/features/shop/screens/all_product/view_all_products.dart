import 'package:flutter/material.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/common/widgets/products/sortable/product_sortable.dart';

class ViewAllProductScreen extends StatelessWidget {
  const ViewAllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: CAppBar(
        title: Text(
          'Popular Products',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: SortableProducts(),
        ),
      ),
    );
  }
}



// im-24 ds-24 sbi-16 sbs-32 CL-16 md-16 sbif-16 sm-8
