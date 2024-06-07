import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/colors.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    this.iconData,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  });

  final IconData? iconData;
  final String title;
  final String subTitle;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 28,
        color: TColor.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
