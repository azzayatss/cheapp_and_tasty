import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/theme/app_colors.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/reviews/controllers/average_rate_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AverageRatingBar extends ConsumerWidget {
  const AverageRatingBar({
    required this.locationId,
    super.key,
  });

  final String locationId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rateController = ref.watch(AverageRateControllerProvider(locationId));

    return rateController.when(
      data: (rate) {
        return Row(
          children: [
            Text(
              rate[0].toStringAsFixed(1),
              style: context.textTheme.labelSmall,
            ),
            const SizedBox(
              width: AppLayouts.defaultPadding / 3,
            ),
            RatingBarIndicator(
              itemSize: 15,
              rating: rate[0],
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: AppColors.starIconColor,
              ),
            ),
            const SizedBox(
              width: AppLayouts.defaultPadding / 3,
            ),
            Text(
              '(${rate[1].toInt()})',
              style: context.textTheme.labelSmall,
            ),
          ],
        );
      },
      error: (error, _) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
