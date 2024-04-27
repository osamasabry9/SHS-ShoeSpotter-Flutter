import 'package:flutter/material.dart';
import 'rating_progress_indicator_widget.dart';

class OverallProductRatingsWidget extends StatelessWidget {
  const OverallProductRatingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text("4.5",
              style: Theme.of(context).textTheme.displayLarge),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgressIndicatorWidget(text: "5", value: 1.0),
              RatingProgressIndicatorWidget(text: "4", value: 0.8),
              RatingProgressIndicatorWidget(text: "3", value: 0.6),
              RatingProgressIndicatorWidget(text: "2", value: 0.4),
              RatingProgressIndicatorWidget(text: "1", value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}
