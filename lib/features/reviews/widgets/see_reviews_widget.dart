import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/theme/app_colors.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/reviews/controllers/reviews_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class SeeReviewsWidget extends ConsumerWidget {
  const SeeReviewsWidget({
    required this.locationId,
    super.key,
  });

  final String locationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewList = ref.watch(ReviewsListControllerProvider(locationId));

    return reviewList.when(
      data: (data) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(AppLayouts.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr.reviews,
                  style: context.textTheme.headlineSmall,
                ),
                const Divider(),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 175,
                  ),
                  child: data.isEmpty
                      ? const Text('There are no reviews yet :(')
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final formatedDate =
                                DateFormat('yyyy-MM-dd HH:mm:ss')
                                    .format(data[index].creationDate);
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(
                                  AppLayouts.defaultPadding,
                                ),
                                child: SizedBox(
                                  width: 225,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(data[index].user),
                                      const SizedBox(
                                        width: AppLayouts.defaultPadding / 2,
                                      ),
                                      Text(formatedDate),
                                      const SizedBox(
                                        height: AppLayouts.defaultPadding / 2,
                                      ),
                                      RatingBarIndicator(
                                        itemSize: 20,
                                        rating: data[index].rate,
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: AppColors.starIconColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: AppLayouts.defaultPadding / 2,
                                      ),
                                      Expanded(
                                        child: Text(
                                          data[index].comment,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
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
