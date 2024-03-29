import 'package:flutter/material.dart';
import 'package:shoe_spotter/core/utils/constants/text_strings.dart';

class OnBoardingSkipWidget extends StatelessWidget {
  const OnBoardingSkipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          
        },
        child: const Text(AppTexts.skip),
      ),
    );
  }
}
