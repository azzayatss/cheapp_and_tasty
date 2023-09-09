import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/theme/app_colors.dart';
import 'package:cheapp_and_tasty/features/location/controllers/rate_controller.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RateBarDisplaymentWidget extends ConsumerWidget {
  const RateBarDisplaymentWidget({
    required this.location,
    required this.textStyle,
    required this.starSize,
    super.key,
  });

  final LocationEntity location;
  final TextStyle? textStyle;
  final double starSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rate =
        ref.watch(rateControllerProvider(rateList: location.locationRatesList));

    return rate.when(
      data: (data) {
        return Row(
          children: [
            Text(
              '${data.roundToDouble()}',
              style: textStyle,
            ),
            const SizedBox(
              width: AppLayouts.defaultPadding / 4,
            ),
            RatingBarIndicator(
              itemSize: starSize,
              rating: data.roundToDouble(),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: AppColors.starIconColor,
              ),
            ),
            const SizedBox(
              width: AppLayouts.defaultPadding / 4,
            ),
            Text(
              '(${location.rateVotedUsers?.length ?? 0})',
              style: textStyle,
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
