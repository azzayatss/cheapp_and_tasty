import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/features/reviews/widgets/review_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SeparateReviewScreen extends ConsumerWidget {
  const SeparateReviewScreen({
    required this.creationDate,
    required this.user,
    required this.rate,
    required this.comment,
    super.key,
  });

  final String creationDate;
  final String user;
  final String rate;
  final String comment;

  static const route =
      'separate-review-screen/:user/:rate/:comment/:creationDate';
  static const routeName = 'separateReviewScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Відгук'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayouts.defaultPadding),
          child: ReviewCardWidget(
            creationDate: creationDate,
            user: user,
            rate: rate,
            comment: comment,
            isFullScreen: true,
          ),
        ),
      ),
    );
  }
}
