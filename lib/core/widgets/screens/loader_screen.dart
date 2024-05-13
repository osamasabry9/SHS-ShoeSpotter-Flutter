import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: CircularProgressIndicator(color: AppColors.white),
      ),
    );
  }
}
