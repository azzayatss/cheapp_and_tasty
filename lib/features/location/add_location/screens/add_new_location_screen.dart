import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/fake_data/fake_data_constants.dart';
import 'package:cheapp_and_tasty/config/theme/app_colors.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
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
    final currentUser = ref.read(signInControllerProvider);
    final locationNameController = useTextEditingController();
    final locationDescriptionController = useTextEditingController();
    final locationAdressController = useTextEditingController();
    final locationScheduleController = useTextEditingController();
    final locationReviewController = useTextEditingController();
    final selectedServices = useRef(<String>[]);
    final initialRate = useState<double>(3);

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
                            initialRating: initialRate.value,
                            minRating: 1,
                            allowHalfRating: true,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: AppColors.starIconColor,
                            ),
                            onRatingUpdate: (rating) {
                              initialRate.value = rating;
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
                        AddServiceChipWidget(
                          onChanged: (value) => selectedServices.value = value,
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
                                  locationRate: initialRate.value,
                                  personWhoAddedLocation:
                                      currentUser.value?.email ?? '',
                                  dateTimeWhenLocationAdded: DateTime.now(),
                                  //todo azzayats -> replace hardcoded values with image picker
                                  locationMenuImages: [
                                    FakeData.locationImagesExample,
                                    FakeData.locationImagesExample,
                                    FakeData.locationImagesExample,
                                    FakeData.locationImagesExample,
                                    FakeData.locationImagesExample,
                                  ],
                                  //todo azzayats -> replace hardcoded values with image picker
                                  locationImages: [
                                    FakeData.locationImagesExample,
                                    FakeData.locationImagesExample,
                                    FakeData.locationImagesExample,
                                    FakeData.locationImagesExample,
                                    FakeData.locationImagesExample,
                                  ],
                                  additionalServicesChips: [],
                                  //todo azzayats -> replace hardcoded values with image picker
                                  locationCoverPhoto:
                                      FakeData.locationImagesExample,
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

//todo azzayatss: move this class to the separate file
class AddServiceChipWidget extends HookWidget {
  const AddServiceChipWidget({
    required this.onChanged,
    super.key,
  });

  final ValueChanged<List<String>> onChanged;

  @override
  Widget build(BuildContext context) {
    final selectedState = useReducer<List<String>, String>(
      (state, value) {
        if (state.contains(value)) {
          return [...state..remove(value)];
        } else {
          return [...state..add(value)];
        }
      },
      initialState: [],
      initialAction: '',
    );
    return Wrap(
      spacing: AppLayouts.defaultPadding / 3,
      children: AdditionalServicesChips.values
          .map(
            (value) => GestureDetector(
              onTap: () {
                selectedState.dispatch(value.name);
                onChanged(selectedState.state);
              },
              child: Chip(
                backgroundColor: selectedState.state.contains(value.name)
                    //todo azzayatss: replace background color with colored border + colored text
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
                    Text(value.chipLabel(context.tr)),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
