import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'profile_menu_widget.dart';

class HeaderPersonalInfoSectionWidget extends StatelessWidget {
  const HeaderPersonalInfoSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileMenuWidget(
            title: "User ID",
            value: "991111",
            icon: Iconsax.copy,
            onPressed: () {}),
        ProfileMenuWidget(
            title: "E-mail", value: "osam@sabry.com", onPressed: () {}),
        ProfileMenuWidget(
            title: "Phone Number", value: "+2010133445", onPressed: () {}),
        ProfileMenuWidget(title: "Gender", value: "Male", onPressed: () {}),
        ProfileMenuWidget(
            title: "Date of Birth", value: "11 Nov 1999", onPressed: () {}),
      ],
    );
  }
}
