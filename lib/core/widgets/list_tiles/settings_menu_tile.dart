import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({super.key, required this.title, required this.subTitle, required this.icon, this.onTap, this.trailing});
final String title , subTitle;
final IconData icon;
final VoidCallback? onTap;
final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
      leading: Icon(icon , color: AppColors.primary , size: 28,),
      trailing: trailing,
      onTap: onTap,
    );
  }
}