import '../../../../core/utils/constants/text_strings.dart';

import '../../../../core/utils/constants/image_strings.dart';
import 'on_boarding_page_view_widget.dart';

class OnBoardingPageViewItems {
  static List<OnBoardingPageViewWidget> introPages = [
    const OnBoardingPageViewWidget(
        image: AppImages.onBoardingImage1,
        headline: AppTexts.onBoardingTitle1,
        description: AppTexts.onBoardingSubTitle1),
    const OnBoardingPageViewWidget(
        image: AppImages.onBoardingImage2,
        headline: AppTexts.onBoardingTitle2,
        description: AppTexts.onBoardingSubTitle2),
    const OnBoardingPageViewWidget(
        image: AppImages.onBoardingImage3,
        headline: AppTexts.onBoardingTitle3,
        description: AppTexts.onBoardingSubTitle3)
  ];
}
