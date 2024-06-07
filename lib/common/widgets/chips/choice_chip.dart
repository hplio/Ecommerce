import 'package:flutter/material.dart';
import 'package:to_do/common/custom_shap/container_shap.dart';
import 'package:to_do/utils/constants/colors.dart';
import 'package:to_do/utils/helpers/helper_fc.dart';

class KChoiceChip extends StatelessWidget {
  const KChoiceChip({
    super.key,
    required this.value,
    required this.selected,
    this.onSelected,
    this.padding,
  });
  final String value;
  final bool selected;
  final Function(bool)? onSelected;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final bool isColor = KHelperFunction.getColor(value) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor
            ? const SizedBox()
            : Text(
                value,
                style:
                    TextStyle(color: selected ? TColor.white : TColor.darkGrey
                        // color: selected ? TColor.white : TColor.black,
                        ),
              ),
        selected: selected,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        avatar: isColor
            ? CustomCirculerShap(
                hight: 50, width: 50, color: KHelperFunction.getColor(value)!)
            : null,
        labelStyle:
            TextStyle(color: selected ? KHelperFunction.getColor(value) : null),
        shape: isColor
            ? CircleBorder(
                side: BorderSide(
                  color:
                      isColor ? KHelperFunction.getColor(value)! : TColor.black,
                ),
              )
            : null,
        backgroundColor: isColor ? KHelperFunction.getColor(value) : null,
        onSelected: onSelected,
      ),
    );
  }
}
