import 'package:flutter/material.dart';

class GridLayOut extends StatelessWidget {
  const GridLayOut({
    super.key,
    required this.itemBuilder,
    this.mainAxisExtent = 288,
    this.itemCount,
  });
  final Widget? Function(BuildContext, int) itemBuilder;
  final double mainAxisExtent;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        mainAxisExtent: mainAxisExtent,
        crossAxisSpacing: 16,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
