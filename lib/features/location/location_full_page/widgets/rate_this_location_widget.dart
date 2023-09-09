import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
import 'package:cheapp_and_tasty/features/location/add_location/widgets/add_rating_widget.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/controllers/location_list_controller.dart';
import 'package:cheapp_and_tasty/features/location/repositories/locations_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RateThisLocationWidget extends ConsumerWidget {
  const RateThisLocationWidget({required this.id, super.key});

  final String? id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(locationListControllerProvider);

    return list.when(
      data: (data) {
        final location = data.firstWhere((element) => element.locationId == id);
        final currentUser = ref.watch(signInControllerProvider).valueOrNull;
        final votedList = location.rateVotedUsers ?? [];

        if (votedList.contains(currentUser?.email ?? '')) {
          return const SizedBox.shrink();
        }

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(AppLayouts.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Відвідали цей заклад?',
                  style: context.textTheme.headlineSmall,
                ),
                const Divider(),
                const SizedBox(
                  height: AppLayouts.defaultPadding,
                ),
                AddRatingWidget(
                  onRatingUpdate: (rating) {
                    final rates =
                        List<double>.from(location.locationRatesList ?? [])
                          ..add(rating);

                    final votedPersons =
                        List<String>.from(location.rateVotedUsers ?? [])
                          ..add(currentUser?.email ?? '');

                    final newVotedPersons = <String, List<String>>{
                      'rateVotedUsers': votedPersons,
                    };

                    final newRates = <String, List<double>>{
                      'locationRatesList': rates,
                    };

                    LocationRepository().updateLocationRate(
                      location.locationId,
                      newRates,
                      newVotedPersons,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Дякуємо, ваш голос врахований ✅'),
                      ),
                    );
                  },
                  initialRating: 0,
                ),
                const SizedBox(
                  height: AppLayouts.defaultPadding,
                ),
                Text(
                  'Ваша оцінка допоможе іншим користувачам оприділитись з вибором 🙌',
                  style: context.textTheme.labelMedium,
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
