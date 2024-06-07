import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/colors.dart';

class ImageTextWidget extends StatelessWidget {
  const ImageTextWidget({
    super.key, 
    required this.imageString, 
    required this.text, 
    this.bgColor=TColor.white, 
    this.onPress, 
    this.textColor=TColor.white,
  });

  final String imageString;
  final String text;
  final Color? bgColor;
  final Color? textColor;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {

    final bool dark=Theme.of(context).brightness==Brightness.dark;
    return GestureDetector(
      onTap:onPress ,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                // color: TColor.white,
                color: bgColor??(dark?TColor.dark:TColor.white),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image(
                    image: AssetImage(imageString),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            SizedBox(
              width: 55,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      // color:dark?TColor.light:TColor.dark,
                      color: textColor,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
