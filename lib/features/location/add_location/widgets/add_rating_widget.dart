import 'package:cheapp_and_tasty/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddRatingWidget extends StatelessWidget {
  const AddRatingWidget({
    required this.onRatingUpdate,
    required this.initialRating,
    super.key,
  });

  final void Function(double) onRatingUpdate;
  final double initialRating;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: RatingBar.builder(
        initialRating: initialRating,
        minRating: 1,
        allowHalfRating: true,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: AppColors.starIconColor,
        ),
        onRatingUpdate: onRatingUpdate,
      ),
    );
  }
}
