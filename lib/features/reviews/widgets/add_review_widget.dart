import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
import 'package:cheapp_and_tasty/features/reviews/entities/review_entity.dart';
import 'package:cheapp_and_tasty/features/reviews/repositories/reviews_repository.dart';
import 'package:cheapp_and_tasty/features/reviews/widgets/rating_bar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddReviewWidget extends HookConsumerWidget {
  const AddReviewWidget({
    required this.isInitial,
    this.initialOnRatingUpdate,
    this.initialController,
    this.locationId,
    super.key,
  });

  final bool isInitial;
  final void Function(double)? initialOnRatingUpdate;
  final TextEditingController? initialController;
  final String? locationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(signInControllerProvider);
    final rate = useState(isInitial ? 3.0 : 0.0);
    final controller = useTextEditingController();

    return user.when(
      data: (user) {
        if (isInitial) {
          return ReviewBody(
            isInitial: isInitial,
            initialOnRatingUpdate: initialOnRatingUpdate,
            rate: rate,
            initialController: initialController,
            controller: controller,
            locationId: locationId,
            user: user,
          );
        } else {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(AppLayouts.defaultPadding),
              child: ReviewBody(
                isInitial: isInitial,
                initialOnRatingUpdate: initialOnRatingUpdate,
                rate: rate,
                initialController: initialController,
                controller: controller,
                locationId: locationId,
                user: user,
              ),
            ),
          );
        }
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

class ReviewBody extends StatelessWidget {
  const ReviewBody({
    required this.isInitial,
    required this.initialOnRatingUpdate,
    required this.rate,
    required this.initialController,
    required this.controller,
    required this.locationId,
    required this.user,
    super.key,
  });

  final bool isInitial;
  final void Function(double p1)? initialOnRatingUpdate;
  final ValueNotifier<double> rate;
  final TextEditingController? initialController;
  final TextEditingController controller;
  final String? locationId;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isInitial)
          Text(
            context.tr.locationRateLabel,
            style: isInitial
                ? context.textTheme.bodyLarge
                : context.textTheme.headlineSmall,
          )
        else
          Text(
            context.tr.haveYouVisited,
            style: isInitial
                ? context.textTheme.bodyLarge
                : context.textTheme.headlineSmall,
          ),
        const SizedBox(
          height: AppLayouts.defaultPadding,
        ),
        RatingBarWidget(
          onRatingUpdate: isInitial
              ? initialOnRatingUpdate!
              : (rating) {
                  rate.value = rating;
                },
          initialRating: rate.value,
        ),
        const SizedBox(
          height: AppLayouts.defaultPadding,
        ),
        TextFormField(
          controller: isInitial ? initialController : controller,
          maxLines: 3,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: context.tr.locationReviewHint,
            labelText: isInitial
                ? context.tr.locationReviewLabel
                : context.tr.leaveYourFeedback,
          ),
        ),
        if (!isInitial) ...[
          const SizedBox(
            height: AppLayouts.defaultPadding,
          ),
          Center(
            child: FilledButton(
              onPressed: () {
                final newReview = ReviewEntity(
                  user: user?.email ?? '',
                  rate: rate.value,
                  comment: controller.text,
                  creationDate: DateTime.now(),
                );

                ReviewsRepository().addReview(
                  newReview: newReview.toJson(),
                  locationId: locationId!,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(context.tr.thanksForFeedback),
                  ),
                );
              },
              child: Text(context.tr.save),
            ),
          ),
        ],
      ],
    );
  }
}
