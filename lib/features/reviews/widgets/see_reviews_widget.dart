import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/reviews/controllers/reviews_controller.dart';
import 'package:cheapp_and_tasty/features/reviews/screens/separate_review_screen.dart';
import 'package:cheapp_and_tasty/features/reviews/widgets/review_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                      ? Text(context.tr.noOneHasLeftReview)
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final formatedDate =
                                DateFormat('yyyy-MM-dd HH:mm:ss')
                                    .format(data[index].creationDate);
                            return GestureDetector(
                              onTap: () => context.pushNamed(
                                SeparateReviewScreen.routeName,
                                queryParameters: {
                                  'locationId': locationId,
                                  'creationDate': formatedDate,
                                  'user': data[index].user,
                                  'rate': data[index].rate.toString(),
                                  'comment': data[index].comment,
                                },
                              ),
                              child: ReviewCardWidget(
                                creationDate: formatedDate,
                                user: data[index].user,
                                rate: data[index].rate.toString(),
                                comment: data[index].comment,
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
