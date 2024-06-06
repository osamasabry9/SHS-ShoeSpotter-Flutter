import 'package:flutter/material.dart';
import 'widgets/re_auth_form_widget.dart';

import '../../../../../core/utils/constants/sizes.dart';

class ReAuthLoginFormScreen extends StatelessWidget {
  const ReAuthLoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Re-Authentication User")),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: ReAuthFormWidget(),
        ),
      ),
    );
  }
}
