import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/size.dart';

class OnBordingPage extends StatelessWidget {
  const OnBordingPage({
    super.key,
    required this.imageString,
    required this.onBordingTitle,
    required this.onBordingSubTitle,
  });

  final String imageString, onBordingTitle, onBordingSubTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Image(
            height: KSizeScreen.getScreenHeight(context) * 0.6,
            width: KSizeScreen.getScreenWidth(context) * 0.8,
            image: AssetImage(
              imageString,
            ),
          ),
          Text(
            onBordingTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            onBordingSubTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
