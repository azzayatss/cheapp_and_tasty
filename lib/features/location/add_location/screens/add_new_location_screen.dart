import 'package:cheapp_and_tasty/config/app_colors.dart';
import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
import 'package:cheapp_and_tasty/features/location/add_location/controllers/chip_controller.dart';
import 'package:cheapp_and_tasty/features/location/add_location/controllers/rating_controller.dart';
import 'package:cheapp_and_tasty/features/location/controllers/global_location_list_controller.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location/enums/additional_services_chips.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/screens/locations_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class AddNewLocationScreen extends HookConsumerWidget {
  const AddNewLocationScreen({super.key});
  static const String route = 'add-new-location';
  static const String routeName = 'addNewLocation';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationNameController = useTextEditingController();
    final locationDescriptionController = useTextEditingController();
    final locationAdressController = useTextEditingController();
    final locationScheduleController = useTextEditingController();
    final locationReviewController = useTextEditingController();
    final currentUser = ref.read(signInControllerProvider);
    final list = ref.watch(chipControllerProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.tr.addNewLocationTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppLayouts.defaultPadding),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(AppLayouts.defaultPadding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          //todo azzayats: підключити завантаження з девайсу, продумати аплоад в бд, продумати прийом з бд.
                          context.tr.coverPhotoLabel,
                          style: context.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Align(
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.image_outlined),
                            label: Text(context.tr.uploadPhotoLabel),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    TextFormField(
                      controller: locationNameController,
                      decoration: InputDecoration(
                        hintText: context.tr.locationNameHint,
                        labelText: context.tr.locationNameLabel,
                      ),
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    TextFormField(
                      controller: locationDescriptionController,
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: context.tr.locationDescriptionHint,
                        labelText: context.tr.locationDescriptionLabel,
                      ),
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    TextFormField(
                      controller: locationAdressController,
                      decoration: InputDecoration(
                        hintText: context.tr.locationAdressHint,
                        labelText: context.tr.locationAdressLabel,
                      ),
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    TextFormField(
                      controller: locationScheduleController,
                      decoration: InputDecoration(
                        hintText: context.tr.locationScheduleHint,
                        labelText: context.tr.locationScheduleLabel,
                      ),
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    TextFormField(
                      controller: locationReviewController,
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: context.tr.locationReviewHint,
                        labelText: context.tr.locationReviewLabel,
                      ),
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr.locationRateLabel,
                          style: context.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Align(
                          child: RatingBar.builder(
                            initialRating: ref.watch(ratingControllerProvider),
                            minRating: 1,
                            allowHalfRating: true,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: AppColors.starIconColor,
                            ),
                            onRatingUpdate: (rating) {
                              ref
                                  .read(ratingControllerProvider.notifier)
                                  .newRate(rating: rating);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr.otherServicesLabel,
                          style: context.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Wrap(
                          spacing: AppLayouts.defaultPadding / 3,
                          children: AdditionalServicesChips.values
                              .map(
                                (value) => GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(chipControllerProvider.notifier)
                                        .addRemoveToList(value.name);
                                  },
                                  child: Chip(
                                    backgroundColor: list.contains(value.name)
                                        ? Colors.green
                                        : null,
                                    label: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          value.icon,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: AppLayouts.defaultPadding / 2,
                                        ),
                                        Text(value.chipLabel(context)),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //todo azzayats: підключити завантаження з девайсу, продумати аплоад в бд, продумати прийом з бд.
                              context.tr.addMenuPhotosLabel,
                              style: context.textTheme.bodyLarge,
                            ),
                            const SizedBox(height: AppLayouts.defaultPadding),
                            Align(
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.image_outlined),
                                label: Text(context.tr.uploadPhotoLabel),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //todo azzayats: підключити завантаження з девайсу, продумати аплоад в бд, продумати прийом з бд.
                              context.tr.addLocationPhotosLabel,
                              style: context.textTheme.bodyLarge,
                            ),
                            const SizedBox(height: AppLayouts.defaultPadding),
                            Align(
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.image_outlined),
                                label: Text(context.tr.uploadPhotoLabel),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                showDialog<AlertDialog>(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(context.tr.areYouSure),
                                      content: Text(
                                        context.tr.areYouSureDescription,
                                      ),
                                      actions: [
                                        FilledButton(
                                          onPressed: () => context.pop(),
                                          child: Text(
                                            context.tr.continiueCreating,
                                          ),
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                            context
                                              ..pop()
                                              ..go(LocationsListScreen.route);
                                          },
                                          child:
                                              Text(context.tr.cancelCreating),
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(context.tr.cancel),
                            ),
                            FilledButton(
                              onPressed: () {
                                final newLocation = LocationEntity(
                                  locationName: locationNameController.text,
                                  locationId: const Uuid().v4(),
                                  locationDescription:
                                      locationDescriptionController.text,
                                  //todo azzayats -> replace hardcoded values with add on map feature in future
                                  locationLatitude: 0,
                                  locationLongitude: 0,
                                  locationAdress: locationAdressController.text,
                                  locationWorkingSchedule:
                                      locationScheduleController.text,
                                  locationReviews:
                                      locationReviewController.text,
                                  locationRate:
                                      ref.watch(ratingControllerProvider),
                                  personWhoAddedLocation:
                                      currentUser.value?.email ?? '',
                                  dateTimeWhenLocationAdded: DateTime.now(),
                                  //todo azzayats -> replace hardcoded values with image picker
                                  locationMenuImages: [
                                    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                                    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                                    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                                    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                                    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                                  ],
                                  //todo azzayats -> replace hardcoded values with image picker
                                  locationImages: [
                                    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                                    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                                    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                                    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                                    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                                  ],
                                  additionalServicesChips:
                                      ref.watch(chipControllerProvider),
                                  //todo azzayats -> replace hardcoded values with image picker
                                  locationCoverPhoto:
                                      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                                );

                                ref
                                    .read(
                                      globalLocationsListControllerProvider
                                          .notifier,
                                    )
                                    .add(newLocation);

                                context.pop();
                              },
                              child: Text(context.tr.save),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//  void _onTap(int index)
//    => switch(index){
//        0 => context.go('location0'),
//        1 => context.go('location1'),
//        2 => context.go('location2'),
//        _ => ''
//     };

// final newLocation = LocationEntity(
//   locationId: '222222',
//   locationName: 'test name2',
//   locationDescription: 'test description',
//   locationAdress: 'проспект Свободи 5',
//   locationLatitude: 10,
//   locationLongitude: 10,
//   locationWorkingSchedule:
//       'пн-пт: 10:00-17:00; сб-нд: вихідні',
//   locationReviews: 'test review',
//   locationRate: 5,
//   personWhoAddedLocation: 'andrii zajats',
//   dateTimeWhenLocationAdded: DateTime.now(),
//   doesLocationHaveDelivery: false,
//   doesLocationHaveTakeAway: false,
//   doesLocationHaveOwnParking: false,
//   doesLocationHaveCardPayments: false,
//   locationMenuImages: <String>[
//     // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//     // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//     // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//     // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//     // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//     // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
//   ],
//   locationImages: <String>[
//     'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//     'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//     'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//     'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//     'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//     'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
//   ],
//   locationCoverPhoto:
//       'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
// );
// ref
//     .read(globalLocationsListControllerProvider.notifier)
//     .add(newLocation);
