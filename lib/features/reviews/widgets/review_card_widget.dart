import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({
    required this.creationDate,
    required this.user,
    required this.rate,
    required this.comment,
    this.isFullScreen,
    super.key,
  });

  final String creationDate;
  final String user;
  final String rate;
  final String comment;
  final bool? isFullScreen;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(
          AppLayouts.defaultPadding,
        ),
        child: SizedBox(
          width: isFullScreen ?? false ? null : 225,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user),
              const SizedBox(
                width: AppLayouts.defaultPadding / 2,
              ),
              Text(creationDate),
              const SizedBox(
                height: AppLayouts.defaultPadding / 2,
              ),
              RatingBarIndicator(
                itemSize: 20,
                rating: double.parse(rate),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: AppColors.starIconColor,
                ),
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding / 2,
              ),
              Expanded(
                child: Text(
                  comment,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
